#ifndef _LEVITATION_H
#define _LEVITATION_H

#include <Eigen/Core>
#include "transducers.h"
#include "objFunc.h"
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

class Levitation {
private:
	double x, y, z, K1, K2;
	TransducerLayout layout;
	weighs w;
	pressures_t M, P;
	unsigned int numTrans;
public:
	Levitation(double x_, double y_, double z_, TransducerLayout tl, double K1_, double K2_, weighs wg) {
		layout = tl;
		K1 = K1_;
		K2 = K2_;
		w = wg;
		x = x_;
		y = y_;
		z = z_;
		numTrans = layout.getNumberOfTransducers();

		M.M = layout.getP(x,y,z);
		M.Mx = layout.getPx(x,y,z);
		M.My = layout.getPy(x,y,z);
		M.Mz = layout.getPz(x,y,z);
		M.Mxx = layout.getPxx(x,y,z);
		M.Mxy = layout.getPxy(x,y,z);
		M.Mxz = layout.getPxz(x,y,z);
		M.Myy = layout.getPyy(x,y,z);
		M.Myz = layout.getPyz(x,y,z);
		M.Mzz = layout.getPzz(x,y,z);
		M.Mxxx = layout.getPxxx(x,y,z);
		M.Mxyy = layout.getPxyy(x,y,z);
		M.Mxzz = layout.getPxzz(x,y,z);
		M.Myxx = layout.getPyxx(x,y,z);
		M.Myyy = layout.getPyyy(x,y,z);
		M.Myzz = layout.getPyzz(x,y,z);
		M.Mzxx = layout.getPzxx(x,y,z);
		M.Mzyy = layout.getPzyy(x,y,z);
		M.Mzzz = layout.getPzzz(x,y,z);
	}

	double operator()(const VectorXd& phi, VectorXd& grad) {
		ArrayXcd exp_phases = (phi.array()*1i).exp();
		P.M = (M.M.array() * exp_phases).matrix();
		P.Mx = (M.Mx.array() * exp_phases).matrix();
		P.My = (M.My.array() * exp_phases).matrix();
		P.Mz = (M.Mz.array() * exp_phases).matrix();
		P.Mxx = (M.Mxx.array() * exp_phases).matrix();
		P.Mxy = (M.Mxy.array() * exp_phases).matrix();
		P.Mxz = (M.Mxz.array() * exp_phases).matrix();
		P.Myy = (M.Myy.array() * exp_phases).matrix();
		P.Myz = (M.Myz.array() * exp_phases).matrix();
		P.Mzz = (M.Mzz.array() * exp_phases).matrix();
		P.Mxxx = (M.Mxxx.array() * exp_phases).matrix();
		P.Mxyy = (M.Mxyy.array() * exp_phases).matrix();
		P.Mxzz = (M.Mxzz.array() * exp_phases).matrix();
		P.Myxx = (M.Myxx.array() * exp_phases).matrix();
		P.Myyy = (M.Myyy.array() * exp_phases).matrix();
		P.Myzz = (M.Myzz.array() * exp_phases).matrix();
		P.Mzxx = (M.Mzxx.array() * exp_phases).matrix();
		P.Mzyy = (M.Mzyy.array() * exp_phases).matrix();
		P.Mzzz = (M.Mzzz.array() * exp_phases).matrix();
		
		return objectiveFunction(&P,w,K1,K2,grad);
	}
};

int levitationWrapper(double x, double y, double z, double K1, double K2, double w, double wx, double wy, double wz, double *initial, double *output);

#endif