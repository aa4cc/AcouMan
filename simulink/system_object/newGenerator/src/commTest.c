#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "stdint.h"

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include <unistd.h>
#include <asm/termios.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {

	const char* port = "/dev/ttyUSB0";
	const int baud = 115200;

	printf("Opening port %s at %dbd\n", port, baud);
	int fp = open(port, O_EXCL | O_RDWR);
	printf("Port has file descriptor %d\n", fp);

	struct termios2 tio;
    memset (&tio, 0, sizeof tio);

    tio.c_cflag |= PARENB;
    tio.c_cflag &= ~CBAUD;
	tio.c_cflag |= BOTHER;
	tio.c_lflag &= ~ICANON;
	tio.c_cc[VTIME] = 10;
	tio.c_ispeed = baud;
	tio.c_ospeed = baud;

    int ret;
	if((ret = ioctl(fp, TCSETS2, &tio))==-1){
		fprintf(stderr, "Setting termios2 structure failed. (%d)\n", ret);
		return -1;
	}

	uint8_t uselessBit = 0;
	write(fp,&uselessBit,1);

	uint8_t openCode[3] = {255,255,240};
	write(fp,openCode,3);

	return close(fp); 
}