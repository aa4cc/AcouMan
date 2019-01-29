#include "levitation.h"
#include <iostream>

using namespace std;

int levitationWrapper(double x, double y, double z, double K1, double K2, double w, double wx, double wy, double wz, double *initial, double *output) {
	VectorXd tx (64);
	VectorXd ty (64);
	ty << -0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035,-0.035,-0.025,-0.015,-0.0050,0.0050,0.015,0.025,0.035;
	tx << -0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.035,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,-0.025,-0.015,-0.015,-0.015,-0.015,-0.015,-0.015,-0.015,-0.015,-0.005,-0.005,-0.005,-0.005,-0.005,-0.005,-0.005,-0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.015,0.015,0.015,0.015,0.015,0.015,0.015,0.015,0.025,0.025,0.025,0.025,0.025,0.025,0.025,0.025,0.035,0.035,0.035,0.035,0.035,0.035,0.035,0.035;


	LBFGSParam<double> param;
	param.m = 6;
    param.epsilon = 1e-5;
    param.max_iterations = 1000;
    param.linesearch = LBFGS_LINESEARCH_BACKTRACKING_ARMIJO;
    param.max_step = 1;

    /*cout << "Parameters:" << endl << "==================" << endl;
    cout << "Correction steps for inverse Hessian: " << param.m << endl;
    cout << "Convergence test tolerance: " << param.epsilon << endl;
    cout << "Delta-based convergence, past steps: " << param.past << endl;
    cout << "Delta-based convergence tolerance: " << param.delta << endl;
    cout << "Maximum iterations: " << param.max_iterations << endl;
    cout << "Line search algorithm: ";
    switch (param.linesearch) {
    	case LBFGS_LINESEARCH_BACKTRACKING_ARMIJO :
    		cout << "Backtracking Armijo" << endl;
    		break;
    	case LBFGS_LINESEARCH_BACKTRACKING_WOLFE :
    		cout << "Backtracking Wolfe" << endl;
    		break;
    	case LBFGS_LINESEARCH_BACKTRACKING_STRONG_WOLFE :
    		cout << "Strong Wolfe" << endl;
    		break;
    	default:
    		cout << "Undefined" << endl;
    }
    cout << "Maximum linesearch trials: " << param.max_linesearch << endl;
    cout << "Maximum step: " << param.max_step << endl;
    cout << "Minimum step: " << param.min_step << endl;
    cout << "Accuracy control tolerance: " << param.ftol << endl;
    cout << "Wolfe coefficient: " << param.wolfe << endl;
    cout << "==========================" << endl;*/

	LBFGSSolver<double> solver(param);

	TransducerLayout layout (tx, ty);

	VectorXd phi (64);
	for (int i = 0; i < 64; i++) {
		phi(i) = initial[i];
	}

	weighs wg;
	wg.w = w;
	wg.wx = wx;
	wg.wy = wy;
	wg.wz = wz;

	Levitation problem (x, y, z, layout, K1, K2, wg);

	double fx;
	int niter = solver.minimize(problem,phi,fx);
	//std::cout << "Solver did " << niter << " iterations, optimum: " << fx << std::endl;
	for (int i=0; i<64; i++) {
		output[i] = phi(i);
	}
	return niter;	
}