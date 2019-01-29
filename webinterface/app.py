#!/usr/bin/env python3

from eventlet.green import socket
import struct
import logging
import subprocess
from threading import Lock, Thread
from flask import Flask, render_template, make_response, Response, jsonify, redirect, url_for
from flask_socketio import SocketIO, emit
from PIL import Image
import numpy as np
import requests
import time
from cv2 import imencode
import calib
import saver

# application runs on a web server (localhost:5000) using Flask
app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
# I/O socket for communication between browser and app
socketio = SocketIO(app, async_mode="threading")

# thread for receiving data from Simulink model
thread = None
thread_lock = Lock()

# demo thread
demo_th = None

# socket for communication with Simulink model
simulink_socket = None

# data objects for different modes
# BOW = ball on water
# BOD = ball on dry surface
# bubble = create high-pressure point at given coordinates with given amplitude
class BOW_Status:
	def __init__(self):
		self.reference = [0,0]
class BOD_Status:
	def __init__(self):
		self.pos_ref = [0,0]
		self.v_ref = [0,0]
class Bubble_Status:
	def __init__(self):
		self.position = [0,0]
		self.pressure = 1500

# platform status
class Status:
	def __init__(self):
		self.mode = 0
		self.ballpos = [0,0]
		self.bow_stat = BOW_Status()
		self.bod_stat = BOD_Status()
		self.bubble_stat = Bubble_Status()
		self.control_locked = False
		self.demo = False

status = Status()

# definitions of control packets for different modes
# the packets are sent to the Simulink model
def BOWPacket():
	data = struct.pack("=B4d",1,status.bow_stat.reference[0],status.bow_stat.reference[1],0,0)
	return data
def BODPacket():
	data = struct.pack("=B4d",2,status.bod_stat.pos_ref[0],status.bod_stat.pos_ref[1],status.bod_stat.v_ref[0],status.bod_stat.v_ref[1])
	return data
def BubblePacket():
	data = struct.pack("=B4d",3,status.bubble_stat.position[0],status.bubble_stat.position[1],status.bubble_stat.pressure,0)
	return data
def ShutdownPacket():
	data = struct.pack("=B4d",0,0,0,0,0)
	return data
def sendControlPacket():
	switcher = {
		0: ShutdownPacket,
		1: BOWPacket,
		2: BODPacket,
		3: BubblePacket
	}
	data = switcher.get(status.mode)
	simulink_socket.sendto(data(), ("127.0.0.1",25000))

# receives data from Simulink and sends them to web
# Simulink sends position of the tracked ball every control period
def readPosThread():
	global simulink_socket
	simulink_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	simulink_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	simulink_socket.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
	simulink_socket.bind(('',25001))

	print('start service ...')

	while True :
		message,address = simulink_socket.recvfrom(128)
		data = struct.unpack("2d", message)
		status.ballpos = list(data);
		web_update()

# handles demo mode
def demoThread():
	BOW_demo = np.load('demo/BOW.npy')
	counter = 0
	while True:
		if status.demo:
			if status.mode == 1:
				status.bow_stat.reference = BOW_demo[counter % BOW_demo.shape[0], : ].tolist()
				sendControlPacket()
				web_update()
				counter += 1
		time.sleep(1/50)

def get_my_ip():
	return subprocess.check_output(['hostname', '--all-ip-addresses']).decode().split()

# function for updating web interface
# sends different packets depending on the current mode
def web_update():
	update_packet = {
		1:status.ballpos + status.bow_stat.reference,
		2:status.ballpos + status.bod_stat.pos_ref,
		3:status.bubble_stat.position + [status.bubble_stat.pressure]
	}
	socketio.emit('update', update_packet.get(status.mode,None), broadcast = True)
	
@socketio.on('connect')
def onconnect():
    global thread
    global demo_th
    with thread_lock:
        if thread is None:
            thread = socketio.start_background_task(target=readPosThread)
    if demo_th is None:
        demo_th = Thread(target = demoThread)
        demo_th.start()

# responds to "lock" request from the web
# this function prevents two users from controlling the web interface simultaneously
@socketio.on('request_lock')
def request_lock():
	if (not status.control_locked):
		status.control_locked = True
		socketio.emit('lock', False, broadcast = True)
	else:
		socketio.emit('lock', True)

# responds to "unlock" request from the web
@socketio.on('request_unlock')
def request_unlock():
	if (status.control_locked):
		status.control_locked = False
		socketio.emit('unlock', broadcast = True)

# responds to the web interface requesting update
@socketio.on('request_update')
def request_update():
	web_update()

@socketio.on('toggle-demo')
def toggle_demo():
	status.demo = not status.demo
	socketio.emit('set_demo',status.demo)

# responds to changing position of the reference in web interface
def bow_ref(position):
	status.bow_stat.reference = position
def bod_ref(position):
	status.bod_stat.pos_ref = position
def bubbles_ref(position):
	status.bubble_stat.position = position
@socketio.on('reference')
def reference(position):
	if (status.demo == True):
		status.demo = False
		socketio.emit('set_demo',False)
	ref_fcn = {
		1:bow_ref,
		2:bod_ref,
		3:bubbles_ref
	}
	fcn = ref_fcn.get(status.mode)
	fcn(position)
	sendControlPacket()
	web_update()
	print("Position set to",position)

# responds to changing pressure in the web interface (only in mode 3)
@socketio.on('pressure')
def pressure(P):
	if (status.demo == True):
		status.demo = False
		socketio.emit('set_demo',False)
	status.bubble_stat.pressure = P
	sendControlPacket()
	web_update()
	print("Pressure set to {} Pa".format(P))

@socketio.on('log')
def log(*args):
    print(*args)

# changes mode
@app.route("/mode/<int:m>")
def set_mode(m):
	if (m != status.mode):
		detector_names = {
			1:'/home/pi/config_ball.json',
			2:'/home/pi/config.json',
			3:'/home/pi/config_ball.json'
		}
		# broadcast "Please wait" message to all web interfaces
		socketio.emit('wait_message', broadcast = True)
		# first, stop the Simulink model
		subprocess.Popen(["systemctl", "stop", "ultraman"], stdout=subprocess.PIPE)
		time.sleep(0.5) # wait until fully stops
		# now, change detector
		requests.post('http://127.0.0.1:5001/config/loadfile',detector_names.get(m,'/home/pi/config_ball.json'))
		time.sleep(3) # wait until new detector starts
		# reactivate Simulink model
		subprocess.Popen(["systemctl", "start", "ultraman"], stdout=subprocess.PIPE)
		time.sleep(0.5)
		status.mode = m
		sendControlPacket()
		socketio.emit('refresh', broadcast=True)
		print("New mode:",status.mode)
		return "CHANGE SUCCESSFUL"
	else:
		return "MODE ALREADY RUNNING"

threshold = 0.5
@socketio.on('threshold')
def set_threshold(t):
	global threshold
	threshold = float(t)/100

height = 75
@socketio.on('height')
def set_height(h):
	global height
	height = float(h)

points = ()
def process_image():
	global points
	points = calib.getCalibPoints()
	socketio.emit('set_progress',100)
	socketio.emit('continue')
detector_ready = False
def change_detector():
	# send detector change request
	requests.post('http://127.0.0.1:5001/config/loadfile','/home/pi/config.json')
	global detector_ready
	# wait 5 seconds for change
	time.sleep(5)
	detector_ready = True

posmeas_thread = None
autocalib_thread = None 
def calib_action(step):
	global posmeas_thread
	global autocalib_thread
	# shuts down the platform at the beginning of calibration
	if step==0:
		status.mode = 0
		sendControlPacket()
	# changes detector
	if step==1:
		if posmeas_thread==None or not posmeas_thread.is_alive():
			posmeas_thread = Thread(target=change_detector)
			posmeas_thread.start() 
	if step==3:
		while posmeas_thread.is_alive():
			time.sleep(0.1)
		global threshold		
		data = {
			'threshold': threshold*100
		}
		return data
	# finds the black dots
	if step==4:
		if autocalib_thread==None or not autocalib_thread.is_alive():
			autocalib_thread = Thread(target=process_image)
			autocalib_thread.start() 
	# returns position of the found dots for verification
	if step==5:
		my_ip = get_my_ip()
		#print(points)
		data = {
			'ip': my_ip[0],
			'points': points
		}
		return data
	# creates and saves H_unrot
	if step==6:
		H = calib.getHomography(points)
		print("H = ", H)
		saver.saveMatrix(H,'/home/pi/H_unrot.bin')
		correction = (height-2.44)/(height-2.44+64)
		print("correction = ", correction)
		saver.saveScalar(correction,'/home/pi/correction.bin')
		saver.saveScalar(0.065,'/home/pi/height.bin')
	return None

@app.route('/img/threshold')
def imthres():
	global threshold
	img = calib.getCalibIMG()
	crop = 30
	imgBW = ((img[crop:-crop,crop:-crop,0]/3)+(img[crop:-crop,crop:-crop,1]/3)+(img[crop:-crop,crop:-crop,2]/3))< threshold*255
	imgBW.dtype='uint8'
	_, img_png = imencode('.png',(1 - imgBW)*255)
	resp = make_response(img_png.tostring())
	resp.content_type = "image/png"
	return resp

@app.route('/calib/<int:page>')
def calibration(page):
	data = calib_action(page)
	return render_template("calib/"+str(page)+".html",data=data)

@app.route('/<service>/<command>')
def systemd(service, command):
	if not service in ('ultraman', 'posmeas'):
		raise RuntimeError("Unallowed service {}".format(service))
	if not command in ('start', 'stop', 'status', 'restart'):
		raise RuntimeError("Unallowed command {}".format(command))

	with subprocess.Popen(["systemctl", command, service], stdout=subprocess.PIPE) as proc:
		if service=='ultraman' and command in ('start','restart'):
			time.sleep(0.5)
			sendControlPacket()
		return Response(proc.stdout.read().decode(), mimetype='text/plain')

@app.route('/poweroff')
def poweroff():
    subprocess.call(["poweroff"])
    return "OK"

@app.route('/reboot')
def reboot():
    subprocess.call(["reboot"])
    return "OK"

@app.route('/ip')
def list_ip():
    return jsonify(get_my_ip())

@app.route('/')
def index():
	status.demo = False
	return render_template("index.html",mode=status.mode)

# @app.route('/ui')
# def ui():
#     return render_template("ui.html", get_my_ip=get_my_ip)

if __name__ == '__main__':
    global app_running
    log = logging.getLogger('werkzeug')
    log.setLevel(logging.ERROR)
    systemd("posmeas","start")
    time.sleep(3)
    socketio.run(app, "::", debug=True, use_reloader=False)