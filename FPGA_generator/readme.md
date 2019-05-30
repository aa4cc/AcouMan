# FPGA Generator

## Description

### Version

Static output frequency (40 kHz).
To be used with __Shield v1.1__.

### Usage

This folder contains a Quartus project for the Terasic DE0 Nano developement board with the Altera Cyclone IV FPGA.
The purpose of this project is to create a 64 channel square signal generator.

### Function

The device is set via UART to generate square wave signals with given duty cycles and phase-shifts at its outputs.
The UART command begins with a three-byte open code sequence `0xfffff0`.
The duty cycles and phase-shifts are sent as nine-bit integers ranging from 0 to 360.
The message is then padded with zeros to fit in a whole number of bytes and terminated with a three-byte stop code sequence `0xfffff1`.
To see an example of the communication, see the [comm demo script](https://gitlab.fel.cvut.cz/aa4cc/acouman/simulink-controller/blob/master/system_object/newGenerator/generatorCommDemo.py).

Currently, the frequency of the outputs is fixed to 40 kHz.
