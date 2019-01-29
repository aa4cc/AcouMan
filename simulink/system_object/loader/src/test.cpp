#include <iostream>
#include <cstdlib>
#include <string>
#include "loader.hpp"

using namespace std;

int main(int argc, char const *argv[])
{
	char corrFName[50], HunrotFName[50], hFName[50];
	cout << "Enter the name of correction file: ";
	cin >> corrFName;
	cout << "Enter the name of H_unrot file: ";
	cin >> HunrotFName;
	cout << "Enter the name of height file: ";
	cin >> hFName;
	loadUp(corrFName, HunrotFName, hFName);
	double correction = getCorrection();
	cout << "Correction is " << correction << std::endl;
	double H_unrot[9];
	copyHUnrot(H_unrot);
	cout << "%% H_unrot = " << endl << "%% [ ";
	for (int i = 0; i < 3; ++i)
	{
		if (i>0) cout << "%% ";
		for (int j = 0; j < 3; ++j)
		{
			cout << H_unrot[j*3+i] << " ";
		}
		cout << ";" << endl;
	}
	cout << "];";
	double height = getHeight();
	cout << "Height is " << height << endl;
	return 0;
}