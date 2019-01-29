import numpy as np
import urllib.request
import cv2
import scipy.ndimage.filters
from scipy.ndimage.morphology import generate_binary_structure, binary_erosion

def getCalibIMG ():
	IP = '127.0.0.1'
	port = '5001'
	detectorName ='White'
	url = 'http://'+IP+':'+port+'/image/'+detectorName+'/image'
	req = urllib.request.urlopen(url)
	image = np.asarray(bytearray(req.read()), dtype="uint8")
	return cv2.imdecode(image, cv2.IMREAD_COLOR)

def getCalibPoints (treshold = 0.5):
	crop = 30;
	img = getCalibIMG()
	treshold *= 255
	crop = 30
	imgBW = ((img[crop:-crop,crop:-crop,0]/3)+(img[crop:-crop,crop:-crop,1]/3)+(img[crop:-crop,crop:-crop,2]/3))< treshold
	imgBW.dtype='uint8'
	return getPeaks(imageCorrections(imgBW))

def getHomography(ptsIMG = None):
	if ptsIMG.any() == None:
		ptsIMG = getCalibPoints()
	ptsReal = np.block([[np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01),np.arange(0.035,-0.035,-0.01)],[np.ones((1,8))*0.035,np.ones((1,8))*0.025,np.ones((1,8))*0.015,np.ones((1,8))*0.005,np.ones((1,8))*-0.005,np.ones((1,8))*-0.015,np.ones((1,8))*-0.025,np.ones((1,8))*-0.035]])
	ptsReal = ptsReal.T
	H, status = cv2.findHomography(ptsIMG, ptsReal)
	return H

def getPeaks(img):
	neighborhood = generate_binary_structure(2,2)
	local_max = scipy.ndimage.filters.maximum_filter(img, footprint=neighborhood)==img
	local_max.dtype = 'uint8'
	background = (img==0)
	background.dtype = 'uint8'
	detected_peaks = local_max ^ background
	detected_peaks.dtype = 'uint8'
	detected_peaks = removePeaksCircumference(detected_peaks,background)
	return findPeaksCentre(detected_peaks)

def imageCorrections(img):
	kerDi = cv2.getStructuringElement(cv2.MORPH_RECT,(5,5))
	imgBW = cv2.dilate(img,kerDi,iterations = 1)
	kerEr = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))
	imgBW = cv2.erode(imgBW,kerEr,iterations = 1)
	imgBW = imgBW*255
	return scipy.ndimage.filters.gaussian_filter(imgBW,5)

def removePeaksCircumference(peaks,background):
	peaksCopy = np.copy(peaks)
	circles = cv2.HoughCircles(background*255,cv2.HOUGH_GRADIENT,1,20,param1=50,param2=17,minRadius=0,maxRadius=60)
	circles = np.round(circles[0, :]).astype("int")
	for (x, y, r) in circles:
		cv2.rectangle(peaksCopy, (x - 5, y - 5), (x + 5, y + 5), 0, -1)
	return peaks^peaksCopy

def sortCenters(centers):
	for i in range(0,8):
		for y in range(0,7):
			for w in range(0,7-y):
				if centers[0,i*8+w] > centers[0,i*8+w+1]:
					a = centers[:,i*8+w]
					centers[:,i*8+w] = centers[:,i*8+w+1] 
					centers[:,i*8+w+1] = a
	return centers


def findPeaksCentre(peaks):
	centers = np.zeros((2,64))
	xmax = peaks.shape[0]
	ymax = peaks.shape[1]
	x = 0
	y = 0
	peaksCount = 0
	pixelCount = 0
	itCount = 0
	while peaksCount!= 64 and itCount <10:
		peaksCount = 0
		for idxy in range(0, ymax):
			for idxx in range(0, xmax):
				if peaks[idxy,idxx] == 1:
					for arx in range(-10, 11):
						for ary in range(-10, 11):
							if peaks[idxy + ary,idxx + arx] ==1:
								x = x+idxx + arx+30
								y = y+idxy+ary+30
								peaks[idxy + ary,idxx+arx] = 0
								pixelCount = pixelCount + 1
					centers[0,peaksCount] = x/pixelCount
					centers[1,peaksCount] = y/pixelCount
					peaksCount = peaksCount+1
					pixelCount = 0
					x = 0
					y = 0
		itCount = itCount +1
	print(peaksCount) 
	return sortCenters(centers).T