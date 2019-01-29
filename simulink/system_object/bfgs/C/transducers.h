#ifndef _TRANSDUCERS_H
#define _TRANSDUCERS_H

#include <Eigen/Core>
#include <complex>
#include <cmath>
#include <iostream>

#define ZERO_TOL	1e-5

using namespace std;

using Eigen::VectorXd;
using Eigen::MatrixXd;
using Eigen::MatrixXcd;
using Eigen::VectorXcd;

class TransducerLayout {
	VectorXd transX, transY;
	#if __cplusplus > 199711L	// GNU++11
		static constexpr double P0 = 5;
		static constexpr double k = 732.733;
		static constexpr double r = 0.005;
	#else
		static const double P0 = 5;
		static const double k = 732.733;
		static const double r = 0.005;
	#endif
public:
	TransducerLayout() {}
	TransducerLayout(VectorXd tx, VectorXd ty) {
		transX = tx;
		transY = ty;
	}
	
	MatrixXcd getPressure(VectorXd x, VectorXd y, VectorXd z) {
		int numTrans = transX.rows();
		int numPP = x.rows();
		MatrixXcd p (numTrans, numPP);

		for (int j = 0; j < numPP; j++) {
			p.col(j) = getP(x(j),y(j),z(j));
		}

		return p;
	}

	VectorXcd getP(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd P (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				P(i) = 2.0*complexExp(k*d)*P0*jn(1,k*r*rho/d)/(k*r*rho);
			else
				P(i) = P0*complexExp(k*d)/d;
		}

		return P;
	}

	VectorXcd getPx(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Px (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Px(i) = ((complexExp(d*k)*P0*xr*(k*r*rho*(-pow(d,2) + pow(rho,2))*jn(0, (k*r*rho)/d) + 2*pow(d,2)*(d - 1i*k*pow(rho,2))*jn(1, (k*r*rho)/d) + 
     k*r*rho*(pow(d,2) - pow(rho,2))*jn(2, (k*r*rho)/d)))/(pow(d,3)*k*r*pow(rho,3)));
			else
				Px(i) = 0;
		}

		return Px;
	}

	VectorXcd getPy(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Py (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Py(i) = -((complexExp(d*k)*P0*yr*(k*r*rho*(-pow(d,2) + pow(rho,2))*jn(0, (k*r*rho)/d) + 2*pow(d,2)*(d - 1i*k*pow(rho,2))*jn(1, (k*r*rho)/d) + 
     k*r*rho*(pow(d,2) - pow(rho,2))*jn(2, (k*r*rho)/d)))/(pow(d,3)*k*r*pow(rho,3)));
			else
				Py(i) = 0;
		}

		return Py;
	}

	VectorXcd getPz(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Pz (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Pz(i) = (complexExp(d*k)*P0*z*((-r)*rho*jn(0, (k*r*rho)/d) + 2*1i*pow(d,2)*jn(1, (k*r*rho)/d) + r*rho*jn(2, (k*r*rho)/d)))/(pow(d,3)*r*rho);
			else
				Pz(i) = (complexExp(d*k)*(-1 + 1i*d*k)*P0*z)/pow(d,3);
		}

		return Pz;
	}

	VectorXcd getPxx(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Pxx (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Pxx(i) = (1/(pow(d,6)*k*r*pow(rho,5)))*(2*complexExp(d*k)*P0*(d*k*r*(d - rho)*rho*(d + rho)*(pow(d,2)*pow(rho,2) - 2*(2*pow(d,2) + pow(rho,2) - 1i*d*k*pow(rho,2))*pow(xr,2))*jn(0, (k*r*rho)/d) - 
    (2*pow(d,6)*pow(rho,2) + pow(d,4)*(-1 - 1i*d*k)*pow(rho,4) + (-8*pow(d,6) + pow(d,4)*(4 + 4*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + pow(d,2)*(1 + k*(d*(-1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(xr,2))*
     jn(1, (k*r*rho)/d)));
			else
				Pxx(i) = 0;
		}

		return Pxx;
	}

	VectorXcd getPxy(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Pxy (numTrans);
		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Pxy(i) = - (1/(pow(d,6)*k*r*pow(rho,5)))*(2*complexExp(d*k)*P0*xr*yr*(-2*d*k*r*(d - rho)*rho*(d + rho)*
     (2*pow(d,2) + pow(rho,2) - 1i*d*k*pow(rho,2))*jn(0, (k*r*rho)/d) + 
    (8*pow(d,6) + pow(d,4)*(-4 - k*(4*1i*d + k*pow(r,2)))*pow(rho,2) + pow(d,2)*(-1 + k*(1i*d - pow(d,2)*k + 2*k*pow(r,2)))*pow(rho,4) - 
      pow(k,2)*pow(r,2)*pow(rho,6))*jn(1, (k*r*rho)/d)));
			else
				Pxy(i) = 0;
		}

		return Pxy;
	}

	VectorXcd getPxz(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Pxz (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Pxz(i) = - (2*complexExp(d*k)*P0*xr*z*(d*k*r*rho*(pow(d,2) + 1i*pow(d,3)*k + 2*pow(rho,2) - 2*1i*d*k*pow(rho,2))*jn(0, (k*r*rho)/d) + 
    (2*pow(d,4)*(-1 - 1i*d*k) + pow(d,2)*(-1 + k*(1i*d - pow(d,2)*k + k*pow(r,2)))*pow(rho,2) - pow(k,2)*pow(r,2)*pow(rho,4))*jn(1, (k*r*rho)/d)))/(pow(d,6)*k*r*pow(rho,3));
			else
				Pxz(i) = 0;
		}

		return Pxz;
	}

	VectorXcd getPyy(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Pyy (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Pyy(i) = (1/(pow(d,6)*k*r*pow(rho,5)))*(2*complexExp(d*k)*P0*(d*k*r*(d - rho)*rho*(d + rho)*(pow(d,2)*pow(rho,2) - 2*(2*pow(d,2) + pow(rho,2) - 1i*d*k*pow(rho,2))*pow(yr,2))*jn(0, (k*r*rho)/d) - 
    (2*pow(d,6)*pow(rho,2) + pow(d,4)*(-1 - 1i*d*k)*pow(rho,4) + (-8*pow(d,6) + pow(d,4)*(4 + 4*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + pow(d,2)*(1 + k*(d*(-1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(yr,2))*
     jn(1, (k*r*rho)/d)));
			else
				Pyy(i) = 0;
		}

		return Pyy;
	}

	VectorXcd getPyz(double x, double y, double z) {
		int numTrans = transX.rows();
		VectorXcd Pyz (numTrans);

		for (int i = 0; i < numTrans; i++) {
			double xr = x - transX(i);
			double yr = y - transY(i);
			double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
			double rho = sqrt(pow(xr,2) + pow(yr,2));
			if (rho > ZERO_TOL)
				Pyz(i) = (2*complexExp(d*k)*P0*yr*z*(d*k*r*rho*(pow(d,2) + 1i*pow(d,3)*k + 2*pow(rho,2) - 2*1i*d*k*pow(rho,2))*jn(0, (k*r*rho)/d) + 
    (2*pow(d,4)*(-1 - 1i*d*k) + pow(d,2)*(-1 + k*(1i*d - pow(d,2)*k + k*pow(r,2)))*pow(rho,2) - pow(k,2)*pow(r,2)*pow(rho,4))*jn(1, (k*r*rho)/d)))/(pow(d,6)*k*r*pow(rho,3));
			else
				Pyz(i) = 0;
		}

		return Pyz;
	}

	VectorXcd getPzz(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pzz (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pzz(i) = (2*complexExp(d*k)*P0*((-d)*k*r*rho*(pow(d,2) + 2*1i*(1i + d*k)*pow(z,2))*jn(0, (k*r*rho)/d) + (pow(d,4)*(1 + 1i*d*k) - (pow(d,2) - 1i*pow(d,3)*k + pow(d,4)*pow(k,2) + pow(k,2)*pow(r,2)*pow(rho,2))*pow(z,2))*
     jn(1, (k*r*rho)/d)))/(pow(d,6)*k*r*rho);
		else
			Pzz(i) = (complexExp(d*k)*P0*(pow(d,2)*(-1 + 1i*d*k) - (-3 + d*k*(3*1i + d*k))*pow(z,2)))/pow(d,5);
		}

		return Pzz;
	}

	VectorXcd getPxxx(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pxxx (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pxxx(i) = - (1/(pow(d,9)*k*r*pow(rho,7)))*(2*complexExp(d*k)*P0*xr*(k*r*rho*(-d + rho)*(d + rho)*(6*pow(d,4)*pow(rho,2)*(2*pow(d,2) + pow(rho,2) - 1i*d*k*pow(rho,2)) + 
      (-24*pow(d,6) + pow(d,4)*(-12 + 12*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + pow(d,2)*(-9 + k*(3*d*(3*1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(xr,2))*jn(0, (k*r*rho)/d) + 
    d*(24*pow(d,8)*pow(rho,2) + 3*pow(d,6)*(-4 - k*(4*1i*d + k*pow(r,2)))*pow(rho,4) - 3*pow(d,4)*(1 + k*(d*(-1i + d*k) - 2*k*pow(r,2)))*pow(rho,6) - 3*pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,8) + 
      (-48*pow(d,8) + 8*pow(d,6)*(3 + 3*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + 3*pow(d,4)*(2 + k*(2*d*(-1i + d*k) + k*(-3 - 1i*d*k)*pow(r,2)))*pow(rho,4) + 
        pow(d,2)*(3 - 1i*k*(d*(3 + pow(d,2)*pow(k,2)) - 6*k*(1i + d*k)*pow(r,2)))*pow(rho,6) + pow(k,2)*(7 - 3*1i*d*k)*pow(r,2)*pow(rho,8))*pow(xr,2))*jn(1, (k*r*rho)/d)));
		else
			Pxxx(i) = 0;
		}

		return Pxxx;
	}

	VectorXcd getPxyy(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pxyy (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pxyy(i) = - (1/(pow(d,9)*k*r*pow(rho,7)))*(2*complexExp(d*k)*P0*xr*(k*r*rho*(-d + rho)*(d + rho)*(4*pow(d,6)*pow(rho,2) + 2*pow(d,4)*(1 - 1i*d*k)*pow(rho,4) + 
      (-24*pow(d,6) + pow(d,4)*(-12 + 12*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + pow(d,2)*(-9 + k*(3*d*(3*1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(yr,2))*jn(0, (k*r*rho)/d) - 
    d*(-8*pow(d,8)*pow(rho,2) + pow(d,6)*(4 + 4*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,4) + pow(d,4)*(1 + k*(d*(-1i + d*k) - 2*k*pow(r,2)))*pow(rho,6) + pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,8) + 
      (48*pow(d,8) + 8*pow(d,6)*(-3 - k*(3*1i*d + k*pow(r,2)))*pow(rho,2) + 3*pow(d,4)*(-2 - 2*d*k*(-1i + d*k) + pow(k,2)*(3 + 1i*d*k)*pow(r,2))*pow(rho,4) + 
        pow(d,2)*(-3 + k*(1i*d*(3 + pow(d,2)*pow(k,2)) + 6*k*(1 - 1i*d*k)*pow(r,2)))*pow(rho,6) + pow(k,2)*(-7 + 3*1i*d*k)*pow(r,2)*pow(rho,8))*pow(yr,2))*jn(1, (k*r*rho)/d)));
		else
			Pxyy(i) = 0;
		}

		return Pxyy;
	}

	VectorXcd getPxzz(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pxzz (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pxzz(i) = - (1/(pow(d,9)*k*r*pow(rho,3)))*(2*complexExp(d*k)*P0*xr*(k*r*rho*(pow(d,6)*(1 + 1i*d*k) + 2*pow(d,4)*(1 - 1i*d*k)*pow(rho,2) - 
      (pow(d,4)*(1 + d*k*(-1i + d*k)) + pow(d,2)*(9 + k*(-3*d*(3*1i + d*k) + k*pow(r,2)))*pow(rho,2) - pow(k,2)*pow(r,2)*pow(rho,4))*pow(z,2))*jn(0, (k*r*rho)/d) + 
    d*(2*pow(d,6)*(-1 - 1i*d*k) + pow(d,4)*(-1 + k*(1i*d - pow(d,2)*k + k*pow(r,2)))*pow(rho,2) - pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,4) + 
      (2*pow(d,4)*(1 + d*k*(-1i + d*k)) + pow(d,2)*(3 - 1i*k*(d*(3 + pow(d,2)*pow(k,2)) - 2*k*(1i + d*k)*pow(r,2)))*pow(rho,2) + pow(k,2)*(7 - 3*1i*d*k)*pow(r,2)*pow(rho,4))*pow(z,2))*jn(1, (k*r*rho)/d)));
		else
			Pxzz(i) = 0;
		}

		return Pxzz;
	}

	VectorXcd getPyxx(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pyxx (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pyxx(i) = (1/(pow(d,9)*k*r*pow(rho,7)))*(2*complexExp(d*k)*P0*yr*(k*r*rho*(-d + rho)*(d + rho)*
     (4*pow(d,6)*pow(rho,2) + 2*pow(d,4)*(1 - 1i*d*k)*pow(rho,4) + (-24*pow(d,6) + pow(d,4)*(-12 + 12*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + 
        pow(d,2)*(-9 + k*(3*d*(3*1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(xr,2))*
     jn(0, (k*r*rho)/d) - d*(-8*pow(d,8)*pow(rho,2) + pow(d,6)*(4 + 4*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,4) + 
      pow(d,4)*(1 + k*(d*(-1i + d*k) - 2*k*pow(r,2)))*pow(rho,6) + pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,8) + 
      (48*pow(d,8) + 8*pow(d,6)*(-3 - k*(3*1i*d + k*pow(r,2)))*pow(rho,2) + 3*pow(d,4)*(-2 - 2*d*k*(-1i + d*k) + 
          pow(k,2)*(3 + 1i*d*k)*pow(r,2))*pow(rho,4) + pow(d,2)*(-3 + k*(1i*d*(3 + pow(d,2)*pow(k,2)) + 6*k*(1 - 1i*d*k)*pow(r,2)))*
         pow(rho,6) + pow(k,2)*(-7 + 3*1i*d*k)*pow(r,2)*pow(rho,8))*pow(xr,2))*jn(1, (k*r*rho)/d)));
		else
			Pyxx(i) = 0;
		}

		return Pyxx;
	}

	VectorXcd getPyyy(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pyyy (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pyyy(i) = (1/(pow(d,9)*k*r*pow(rho,7)))*(2*complexExp(d*k)*P0*yr*(k*r*rho*(-d + rho)*(d + rho)*(6*pow(d,4)*pow(rho,2)*(2*pow(d,2) + pow(rho,2) - 1i*d*k*pow(rho,2)) + 
      (-24*pow(d,6) + pow(d,4)*(-12 + 12*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + pow(d,2)*(-9 + k*(3*d*(3*1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(yr,2))*jn(0, (k*r*rho)/d) + 
    d*(24*pow(d,8)*pow(rho,2) + 3*pow(d,6)*(-4 - k*(4*1i*d + k*pow(r,2)))*pow(rho,4) - 3*pow(d,4)*(1 + k*(d*(-1i + d*k) - 2*k*pow(r,2)))*pow(rho,6) - 3*pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,8) + 
      (-48*pow(d,8) + 8*pow(d,6)*(3 + 3*1i*d*k + pow(k,2)*pow(r,2))*pow(rho,2) + 3*pow(d,4)*(2 + k*(2*d*(-1i + d*k) + k*(-3 - 1i*d*k)*pow(r,2)))*pow(rho,4) + 
        pow(d,2)*(3 - 1i*k*(d*(3 + pow(d,2)*pow(k,2)) - 6*k*(1i + d*k)*pow(r,2)))*pow(rho,6) + pow(k,2)*(7 - 3*1i*d*k)*pow(r,2)*pow(rho,8))*pow(yr,2))*jn(1, (k*r*rho)/d)));
		else
			Pyyy(i) = 0;
		}

		return Pyyy;
	}

	VectorXcd getPyzz(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pyzz (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pyzz(i) = (1/(pow(d,9)*k*r*pow(rho,3)))*(2*complexExp(d*k)*P0*yr*(k*r*rho*(pow(d,6)*(1 + 1i*d*k) + 2*pow(d,4)*(1 - 1i*d*k)*pow(rho,2) - 
      (pow(d,4)*(1 + d*k*(-1i + d*k)) + pow(d,2)*(9 + k*(-3*d*(3*1i + d*k) + k*pow(r,2)))*pow(rho,2) - pow(k,2)*pow(r,2)*pow(rho,4))*pow(z,2))*jn(0, (k*r*rho)/d) + 
    d*(2*pow(d,6)*(-1 - 1i*d*k) + pow(d,4)*(-1 + k*(1i*d - pow(d,2)*k + k*pow(r,2)))*pow(rho,2) - pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,4) + 
      (2*pow(d,4)*(1 + d*k*(-1i + d*k)) + pow(d,2)*(3 - 1i*k*(d*(3 + pow(d,2)*pow(k,2)) - 2*k*(1i + d*k)*pow(r,2)))*pow(rho,2) + pow(k,2)*(7 - 3*1i*d*k)*pow(r,2)*pow(rho,4))*pow(z,2))*jn(1, (k*r*rho)/d)));
		else
			Pyzz(i) = 0;
		}

		return Pyzz;
	}

	VectorXcd getPzxx(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pzxx (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pzxx(i) = (1/(pow(d,9)*k*r*pow(rho,5)))*(2*complexExp(d*k)*P0*z*(k*r*rho*(pow(d,6)*(1 + 1i*d*k)*pow(rho,2) + 2*pow(d,4)*(1 - 1i*d*k)*pow(rho,4) + 
      (4*pow(d,6)*(-1 - 1i*d*k) + pow(d,4)*(-2 + k*(2*1i*d - 2*pow(d,2)*k + k*pow(r,2)))*pow(rho,2) + pow(d,2)*(-9 + k*(3*d*(3*1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(xr,2))*
     jn(0, (k*r*rho)/d) + d*(2*pow(d,6)*(-1 - 1i*d*k)*pow(rho,2) + pow(d,4)*(-1 + k*(1i*d - pow(d,2)*k + k*pow(r,2)))*pow(rho,4) - pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,6) + 
      (8*pow(d,6)*(1 + 1i*d*k) + pow(d,4)*(4 + k*(4*d*(-1i + d*k) + k*(-3 - 1i*d*k)*pow(r,2)))*pow(rho,2) + pow(d,2)*(3 - 1i*k*(d*(3 + pow(d,2)*pow(k,2)) - 4*k*(1i + d*k)*pow(r,2)))*pow(rho,4) + 
        pow(k,2)*(7 - 3*1i*d*k)*pow(r,2)*pow(rho,6))*pow(xr,2))*jn(1, (k*r*rho)/d)));
		else
			Pzxx(i) = 0;
		}

		return Pzxx;
	}

	VectorXcd getPzyy(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pzyy (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pzyy(i) = (1/(pow(d,9)*k*r*pow(rho,5)))*(2*complexExp(d*k)*P0*z*(k*r*rho*(pow(d,6)*(1 + 1i*d*k)*pow(rho,2) + 2*pow(d,4)*(1 - 1i*d*k)*pow(rho,4) + 
      (4*pow(d,6)*(-1 - 1i*d*k) + pow(d,4)*(-2 + k*(2*1i*d - 2*pow(d,2)*k + k*pow(r,2)))*pow(rho,2) + pow(d,2)*(-9 + k*(3*d*(3*1i + d*k) - 2*k*pow(r,2)))*pow(rho,4) + pow(k,2)*pow(r,2)*pow(rho,6))*pow(yr,2))*
     jn(0, (k*r*rho)/d) + d*(2*pow(d,6)*(-1 - 1i*d*k)*pow(rho,2) + pow(d,4)*(-1 + k*(1i*d - pow(d,2)*k + k*pow(r,2)))*pow(rho,4) - pow(d,2)*pow(k,2)*pow(r,2)*pow(rho,6) + 
      (8*pow(d,6)*(1 + 1i*d*k) + pow(d,4)*(4 + k*(4*d*(-1i + d*k) + k*(-3 - 1i*d*k)*pow(r,2)))*pow(rho,2) + pow(d,2)*(3 - 1i*k*(d*(3 + pow(d,2)*pow(k,2)) - 4*k*(1i + d*k)*pow(r,2)))*pow(rho,4) + 
        pow(k,2)*(7 - 3*1i*d*k)*pow(r,2)*pow(rho,6))*pow(yr,2))*jn(1, (k*r*rho)/d)));
		else
			Pzyy(i) = 0;
		}

		return Pzyy;
	}

	VectorXcd getPzzz(double x, double y, double z) {
	int numTrans = transX.rows();
	VectorXcd Pzzz (numTrans);
	for (int i = 0; i < numTrans; i++) {
		double xr = x - transX(i);
		double yr = y - transY(i);
		double d = sqrt(pow(xr,2) + pow(yr,2) + pow(z,2));
		double rho = sqrt(pow(xr,2) + pow(yr,2));
		if (rho > ZERO_TOL)
			Pzzz(i) = (1/(pow(d,9)*k*r*rho))*(2*complexExp(d*k)*P0*z*(k*r*rho*(6*pow(d,4)*(1 - 1i*d*k) + (3*pow(d,2)*(-3 + d*k*(3*1i + d*k)) + pow(k,2)*pow(r,2)*pow(rho,2))*pow(z,2))*jn(0, (k*r*rho)/d) - 
    d*(3*pow(d,2)*(pow(d,2) - 1i*pow(d,3)*k + pow(d,4)*pow(k,2) + pow(k,2)*pow(r,2)*pow(rho,2)) + 1i*(pow(d,2)*(3*1i + 3*d*k + pow(d,3)*pow(k,3)) + pow(k,2)*(7*1i + 3*d*k)*pow(r,2)*pow(rho,2))*pow(z,2))*jn(1, (k*r*rho)/d)));
		else
			Pzzz(i) = (complexExp(d*k)*P0*z*(-3*pow(d,2)*(-3 + d*k*(3*1i + d*k)) + (-15 + d*k*(15*1i + d*k*(6 - 1i*d*k)))*pow(z,2)))/pow(d,7);
		}

		return Pzzz;
	}

	__complex__ double complexExp(double x) {
		return cos(x) + 1j*sin(x);
	}

	unsigned int getNumberOfTransducers() {
		return transX.rows();
	}
};

#endif