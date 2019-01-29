#include "genControl.h"
#include <math.h>

int fp;

int generator_open(const char *port, int baud){

	printf("Opening port %s at %dbd\n", port, baud);
	fp = open(port, O_EXCL | O_RDWR);
	printf("Port has file descriptor %d\n", fp);

	struct termios2 tio;
	int ret;
	if((ret=ioctl(fp, TCGETS2, &tio))==-1){
		fprintf(stderr, "Getting termios2 structure failed. (%d)\n", ret);
		return -1;
	}

    tio.c_cflag |= PARENB;
    tio.c_cflag &= ~PARODD;
    tio.c_cflag &= ~CBAUD;
	tio.c_cflag |= BOTHER;
	tio.c_lflag &= ~ICANON;
	tio.c_lflag &= ~ISIG;
	tio.c_lflag &= ~IEXTEN;
	tio.c_lflag &= ~ECHO;
	tio.c_lflag &= ~ECHOE;
	tio.c_lflag &= ~ECHOK;
	tio.c_lflag &= ~ECHOCTL;
	tio.c_lflag &= ~ECHOKE;
	tio.c_iflag &= ~ICRNL;
	tio.c_iflag &= ~IXON;
	tio.c_oflag &= ~OPOST;
	tio.c_oflag &= ~ONLCR;

	tio.c_cc[VTIME] = 10;
	tio.c_cc[VMIN] = 0;
	tio.c_ispeed = baud;
	tio.c_ospeed = baud;

	if((ret = ioctl(fp, TCSETS2, &tio))==-1){
		fprintf(stderr, "Setting termios2 structure failed. (%d)\n", ret);
		return -1;
	}

	return fp;
}

int generator_close(){
    return close(fp); 
}

void generator_sendPacket(void *packet, int len){
    write(fp, packet, len);
    serialFlush(fp); 
}

void writeOctet(uint16_t *data, uint8_t *dest) {
	dest[0] = data[0]>>1;
	int i;
	for (i = 1; i < 8; i++) {
		dest[i] = (data[i-1]<<(8-i)) | (data[i]>>(i+1));
	}
	dest[8] = data[7];
}

void generator_setPhases(double* phases,int on) {
	const uint8_t openCode[3] = {255,255,240};
	const uint8_t closeCode[3] = {255,255,241};

	uint8_t data[144];
	uint16_t octet[8] = {0, DEFAULT_DUTY*on, 0, DEFAULT_DUTY*on, 0, DEFAULT_DUTY*on, 0, DEFAULT_DUTY*on};

	int i,j;
	for (i = 0; i < 16; i++)
	{
		for (j = 0; j < 4; j++) {
			int radToDeg = phases[4*i+j]*180/M_PI;
			radToDeg -= (radToDeg/360)*360;
			if (radToDeg < 0)
				radToDeg += 360;
			octet[2*j] = radToDeg;
		}
		writeOctet(octet, data + 9*i);
	}

	for (i = 0; i < 72; i++) {
		uint8_t temp = data[i];
		data[i] = data[143 - i];
		data[143 - i] = temp;
	}

	generator_sendPacket(openCode,3);
	generator_sendPacket(data,144);
	generator_sendPacket(closeCode,3);
}