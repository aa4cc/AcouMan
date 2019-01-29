#include <cstdlib>
#include <string.h>
#include <Eigen/Core>
#include "transducers.h"
#include "pressurePoints.h"
#include <LBFGS/LBFGS.h>

using namespace LBFGSpp;

using Eigen::MatrixXd;
using Eigen::VectorXd;
int wrapperCustomArray(double *x, double *y, double *z, double *reqPress, unsigned int numPP, double *initial, double *output, double *_tx, double *_ty, unsigned int numTrans) {
	VectorXd tx (numTrans);
	VectorXd ty (numTrans);
	VectorXd phi (numTrans);

	for (int i = 0; i < numTrans; ++i)
	{
		tx(i) = _tx[i];
		ty(i) = _ty[i];
		phi(i) = initial[i];
	}

	LBFGSParam<double> param;
    param.epsilon = 1e-6;
    param.max_iterations = 100;

	LBFGSSolver<double> solver(param);

	TransducerLayout layout (tx, ty);
	VectorXd xV (numPP);
	VectorXd yV (numPP);
	VectorXd zV (numPP);
	VectorXd pressureV (numPP);
	for (int i = 0; i < numPP; i++) {
		xV(i) = x[i];
		yV(i) = y[i];
		zV(i) = z[i];
		pressureV(i) = reqPress[i];
	}	

	PressurePoints problem (xV, yV, zV, pressureV, layout);

	double fx;
	int niter = solver.minimize(problem, phi, fx);
	for (int i=0; i<numTrans; i++) {
		output[i] = phi(i);
	}
	return niter;
}

int pressurePointsWrapper(double *x, double *y, double *z, double *reqPress, unsigned int numPP, double *initial, double *output) {
	VectorXd tx (64);
	VectorXd ty (64);
	ty << -0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035;
	tx << -0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,-0.015,-0.015,-0.015,-0.015,-0.015,-0.015,-0.015,-0.015,-0.005,-0.005,-0.005,-0.005,-0.005,-0.005,-0.005,-0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.015,0.015,0.015,0.015,0.015,0.015,0.015,0.015,0.025,0.025,0.025,0.025,0.025,0.025,0.025,0.025,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035;


	LBFGSParam<double> param;
    param.epsilon = 1e-6;
    param.max_iterations = 100;

	LBFGSSolver<double> solver(param);

	TransducerLayout layout (tx, ty);
	VectorXd xV (numPP);
	VectorXd yV (numPP);
	VectorXd zV (numPP);
	VectorXd pressureV (numPP);
	for (int i = 0; i < numPP; i++) {
		xV(i) = x[i];
		yV(i) = y[i];
		zV(i) = z[i];
		pressureV(i) = reqPress[i];
	}

	VectorXd phi (64);
	for (int i = 0; i < 64; i++) {
		phi(i) = initial[i];
	}

	PressurePoints problem (xV, yV, zV, pressureV, layout);

	double fx;
	int niter = solver.minimize(problem, phi, fx);
	for (int i=0; i<64; i++) {
		output[i] = phi(i);
	}
	return niter;
}