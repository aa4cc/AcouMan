#include "akulev.h"
#include "wiringPi.h"
#include <math.h>

int fp = -1;
int outputState = -1;

int akulev_setbaud(int baud){
	int ret;
	int old_baud;

	fsync(fp);
	usleep(10000);

	struct termios2 tio;
	if((ret=ioctl(fp, TCGETS2, &tio))==-1){
		fprintf(stderr, "Getting termios2 structure failed. (%d)\n", ret);
		return -1;
	}
	tio.c_cflag &= ~CBAUD;
	tio.c_cflag |= BOTHER;
	tio.c_lflag &= ~ICANON;
	tio.c_lflag &= ~ECHO;
	tio.c_cc[VTIME] = 10;
	old_baud = tio.c_ispeed;
	tio.c_ispeed = baud;
	tio.c_ospeed = baud;
	if((ret = ioctl(fp, TCSETS2, &tio))==-1){
		fprintf(stderr, "Setting termios2 structure failed. (%d)\n", ret);
		return -1;
	}
	printf("Baudrate set from %dbd to %dbd\n",old_baud, baud);
	return 0;
}

int akulev_open(const char *port, int baud){
	printf("Opening port %s at %dbd\n", port, baud);
	fp = open(port, O_EXCL | O_RDWR);
	printf("Port has file descriptor %d\n", fp);

	akulev_setbaud(baud);

	return fp;
}

int akulev_close(){
    return close(fp); 
}

void akulev_sendPacket(void *packet, int len){
    write(fp, packet, len);
    //serialFlush(fp); 
}

void akulev_off(){
	if (outputState != 0) {
	   char message[4] ="shdn";
	   akulev_sendPacket(message,4);
	   printf("Outputs turned off\n");
	   outputState = 0;
	}
}

void akulev_on(){
	if (outputState != 1) {
	   char message[4] ="wake";
	   akulev_sendPacket(message,4);
	   printf("Outputs turned on\n");
	   outputState = 1;
	}
}

void akulev_setFreq(double f) {
	// setting frequency divider
	// FPGA clock speed is 3.125 MHz -> divider = 3125[kHz] / f[kHz]
	int divider;
	char message[6] = "freq  ";
	divider = round(3125/f);
	if (divider < 1) {
	   divider = 1;
	}
	else {
		if (divider > 65536)
			divider = 65536;
	}
	uint16_t d = divider - 1;
	message[4] = (char) (d>>8);
	message[5] = (char) (d&0xff);
	
	akulev_sendPacket(message,6);
	printf("Frequency set to %.3f kHz \n",3125.0/divider);	
}

void akulev_setPhases(double* phases) {
	uint8_t toBoard[64];
	uint8_t boardHex[32];
    int i;
	for (i = 0; i < 64; i++) {
		double temp = phases[i];
		int tPhase = round(temp*8/M_PI);
		tPhase -= (tPhase / 16) * 16;
		if (tPhase < 0) {
			tPhase += 16;
		}
        toBoard[i] = tPhase;
	}

	for (i = 0; i < 32; i++) {
		boardHex[i] = (toBoard[63-2*i]<<4) + toBoard[62-2*i];
	}

	akulev_sendPacket("data",4);
	akulev_sendPacket(boardHex,32);
	akulev_sendPacket("sync",4);
	akulev_sendPacket(boardHex,32);
}