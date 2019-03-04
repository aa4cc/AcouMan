
#demonstration of Shifted Signal Generator communication
#Created 04.08.2018


import serial;
import time;
import numpy;

port = serial.Serial('COM5', 230400, parity= serial.PARITY_EVEN) #pozn.: paritu prvni verze generatoru v FPGA nekontroluje, paritni bit jen precte a zahodi (aktualni k 8.4.2018)

# dataArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,180] #set first channel phase to 0, first channel duty to 180 etc. See screenCap files
#dataArray = [1,2,3,4,5,6,7,8] # test data

# dataArray = [118,180,293,180,56,180,120,180,120,180,56,180,293,180,118,180,293,180,120,180,251,180,320,180,320,180,251,180,120,180,293,180,56,180,251,180,30,180,102,180,102,180,30,180,251,180,56,180,120,180,320,180,102,180,177,180,177,180,102,180,320,180,120,180,120,180,320,180,102,180,177,180,177,180,102,180,320,180,120,180,56,180,251,180,30,180,102,180,102,180,30,180,251,180,56,180,293,180,120,180,251,180,320,180,320,180,251,180,120,180,293,180,118,180,293,180,56,180,120,180,120,180,56,180,293,180,0,180]
openCode = [255,255,240] #on receiving openCode, generator will shift further non-code bytes into its settings register
closeCode = [255,255,241] #on receiving stopCode, generator will ignore further non-code bytes. It will also copy data from settings register to individual channels.

for idx in range(64):

	dataArray = []
	dataArray = numpy.zeros(128).astype(int)
	dataArray[2*idx + 1] = 180
	dataStream = ""

	for number in dataArray:
	    ninebit = '{0:09b}'.format(number)      #generator uses 9 bit numbers to set phase and duty!!
	    dataStream += ninebit
	    print("+ ", ninebit)

	bytesArray = [dataStream[i:i+8] for i in range(0, len(dataStream), 8)]
	#print(bytesArray);
	last = bytesArray.pop()
	while len(last)%8 != 0: #appended zeroes will be shifted out of the end of the settings register
	    last += "0";
	bytesArray.append(last)
	#print(bytesArray)
	bytesArray = bytesArray[::-1] #send in reverse order!!




	intsArray = [int(i, 2) for i in bytesArray]

	toSendArray = openCode + intsArray + closeCode
	print("Sending channel settings : ", dataArray)
	print("Actually sending bytes   : ", toSendArray)

	port.write(bytes(toSendArray))

	input('Press enter to continue: ')