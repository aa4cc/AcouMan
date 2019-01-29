#include <iostream>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include "loader.hpp"

double correction;
double H_unrot[9];
double height;

using namespace std;

void loadUp(const char* corrFName, const char* HUnrotFName, const char* heightFName) {
	ifstream corrFile (corrFName,ios::in|ios::binary);
	corrFile.read((char*) &correction,sizeof(double));
	corrFile.close();
	ifstream HuFile (HUnrotFName,ios::in|ios::binary);
	HuFile.read((char*) H_unrot,sizeof(double)*9);
	HuFile.close();
	ifstream hFile (heightFName,ios::in|ios::binary);
	hFile.read((char*) &height,sizeof(double));
	hFile.close();
}

double getCorrection() {
	return correction;
}

void copyHUnrot(double *destination) {
	memcpy(destination, H_unrot, sizeof(double)*9);
}

double getHeight() {
	return height;
}