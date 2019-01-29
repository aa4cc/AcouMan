import numpy
import struct

def saveMatrix(mat,fName):
	with open(fName, 'wb') as file:
		file.write(mat.transpose().tobytes())
	file.closed

def saveScalar(x,fName):
	with open(fName, 'wb') as file:
		x_struct = struct.pack('=d',x)
		file.write(x_struct)
	file.closed

def readScalar(fName):
	with open(fName, 'rb') as file:
		raw_data = file.read(8)
		scalar = struct.unpack('=d', raw_data)
		return scalar[0]
	file.closed