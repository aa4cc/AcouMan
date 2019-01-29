#ifndef _PRESSURE_POINTS_H
#define _PRESSURE_POINTS_H

#include <Eigen/Core>
#include "transducers.h"
#include <LBFGS/LBFGS.h>
#include <cmath>
#include <complex>
#include <iostream>

using namespace LBFGSpp;
using namespace std;

using Eigen::VectorXd;
using Eigen::VectorXcd;
using Eigen::ArrayXcd;
using Eigen::MatrixXcd;

class PressurePoints {
private:
	VectorXd x, y, z, reqPress;
	TransducerLayout layout;
	MatrixXcd M;
	unsigned int numPP, numTrans;
public:
	PressurePoints(VectorXd x_, VectorXd y_, VectorXd z_, VectorXd P_, TransducerLayout tl) {
		layout = tl;
		x = x_;
		y = y_;
		z = z_;
		reqPress = P_;
		numPP = x.rows();
		numTrans = layout.getNumberOfTransducers();

		M = layout.getPressure(x,y,z);
	}

	double operator()(const VectorXd& phi, VectorXd& grad) {
		ArrayXcd phases = phi.array()*1i;
		MatrixXcd P (numTrans, numPP);
		for (int i = 0; i < numPP; i++) {
			P.col(i) = (M.col(i).array() * phases.exp()).matrix();
		}
		MatrixXcd sumP = MatrixXd::Ones(1, numTrans)*P;

		grad = VectorXd::Zero(numTrans);
		double fVal = 0;

		for (int i = 0; i < numPP; i++) {
			complex<double> sumPi = sumP(i);
			MatrixXcd Pcol = P.col(i);

			double residue = abs(sumPi) - reqPress(i);

			grad += 2*( Pcol.real()*(sumPi.imag()) - Pcol.imag()*(sumPi.real()) ) * residue / abs(sumPi);
			fVal += residue*residue;
		}

		return fVal;
	}
};

int wrapperCustomArray(double *x, double *y, double *z, double *reqPress, unsigned int numPP, double *initial, double *output, double *tx, double *ty, unsigned int numTrans);
int pressurePointsWrapper(double *x, double *y, double *z, double *reqPress, unsigned int numPP, double *initial, double *output);

#endif