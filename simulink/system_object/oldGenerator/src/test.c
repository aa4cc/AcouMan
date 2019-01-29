#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>

#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "stdint.h"

//#include "rtwtypes.h"

#include <errno.h>
#include <asm/termios.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int fp;

int akulev_open(const char *port, int baud){
	printf("Opening port %s at %dbd\n", port, baud);
	fp = open(port, O_EXCL | O_RDWR);
	printf("Port has file descriptor %d\n", fp);

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
	tio.c_cc[VTIME] = 10;
	old_baud = tio.c_ispeed;
	tio.c_ispeed = baud;
	tio.c_ospeed = baud;
	if((ret = ioctl(fp, TCSETS2, &tio))==-1){
		fprintf(stderr, "Setting termios2 structure failed. (%d)\n", ret);
		return -1;
	}

	return fp;
}

void akulev_send(void* data, int len) {
	write(fp,data,len);
	serialFlush(fp); 
}

int main() {
	uint8_t testData = 1;
	akulev_open("/dev/ttyUSB0",19200);
	akulev_send(&testData,1);
	exit(0);
}