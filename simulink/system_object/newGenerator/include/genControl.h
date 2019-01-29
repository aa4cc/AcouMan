#ifndef GENERATOR_CONTROL_H
#define GENERATOR_CONTROL_H

#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "stdint.h"

#include "rtwtypes.h"

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include <unistd.h>
#include <asm/termios.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#ifdef __cplusplus
extern "C" {
#endif

//! default duty cycle (180 == 50 %) !//
#define DEFAULT_DUTY		180		

int generator_open(const char *port, int baud);

int generator_close();

void generator_sendPacket(void *packet, int len);

void generator_setPhases(double* phases,int on);

#ifdef __cplusplus
}
#endif

#endif