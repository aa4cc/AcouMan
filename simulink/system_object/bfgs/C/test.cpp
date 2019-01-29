#include "pressurePoints.h"
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <chrono>

#define R 	0.005	// transducer radius

using namespace std;

int main(int argc, char const *argv[])
{
	unsigned int numTrans;
	double x,y,z,P,*tx,*ty,*initial,*output;
	cout << "Enter the number of transducers in a row: ";
	cin >> numTrans;
	cout << "Enter the x,y,z-coordinates of the pressure point: ";
	cin >> x >> y >> z;
	cout << "Enter required pressure [Pa]: ";
	cin >> P;

	tx = new double[numTrans*numTrans];
	ty = new double[numTrans*numTrans];
	initial = new double[numTrans*numTrans];
	output = new double[numTrans*numTrans];

	double coordShift = 0.0 - (numTrans - 1)*R;

	for (int i = 0; i < numTrans; ++i)
	{
		for (int j = 0; j < numTrans; ++j)
		{
			//cout << "(" << coordShift + 2*j*0.005 << "," << coordShift + 2*i*0.005 << ") ";
			tx[j+numTrans*i] = coordShift + 2*j*R;
			ty[j+numTrans*i] = coordShift + 2*i*R;
			initial[j+numTrans*i] = 0;
		}
		//cout << endl;
	}

	auto tic = chrono::system_clock::now();
	int niter = wrapperCustomArray(&x, &y, &z, &P, 1, initial, output, tx, ty, numTrans*numTrans);
	auto toc = chrono::system_clock::now();
	
	std::chrono::duration<double> elapsed = toc-tic;

	cout << "phases:" << endl;
	for (int i = 0; i < numTrans*numTrans; ++i)
	{
		cout << output[i] << endl;
	}

	cout << "solving for " << numTrans*numTrans << " transducers" << endl;
	cout << "LBFGS did " << niter << " iterations in " << elapsed.count() << " seconds" << endl;

	delete tx, ty, initial, output;
	return 0;
}