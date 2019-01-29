#ifndef AKULEV_H
#define AKULEV_H

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

int akulev_setbaud(int baud);
int akulev_open(const char *port, int baud);
int akulev_close();
void akulev_sendPacket(void *packet, int len);
void akulev_setFreq(double f);
void akulev_setPhases(double *phases);
void akulev_off();
void akulev_on();

#ifdef __cplusplus
}
#endif

#endif