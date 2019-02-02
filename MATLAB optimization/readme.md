# MATLAB optimization scripts (deprecated)
[index](../README.md) \> [MATLAB optimization scripts](readme.md)

This document contains a brief introduction to the MATLAB optimization scripts. These scripts calculate phase delays for an array of 64 ultrasonic transducers. 

## Levitation

The 'levitation' folder contains scripts for single beam levitation method shown in an article by [Asier Marzo](https://www.nature.com/articles/ncomms9661). To generate the phase delays, run 'solverscript.m'. You must have the 'MATLAB optimization' folder in your MATLAB path to run this script. 

## Ghost Touch 

The 'ghostTouch' folder contains scripts for creating focused acoustic pressure, similarly to [Ghost Touch](http://doi.acm.org/10.1145/2817721.2817727). To generate the phase delays, use the function 'pressurePoints'. You must have the 'MATLAB optimization' folder in your MATLAB path to run this script.

__NOTE: All optimization scripts are now rewritten in C++ to be ran on the _Raspberry Pi_, the MATLAB scripts can still be used for verification.__