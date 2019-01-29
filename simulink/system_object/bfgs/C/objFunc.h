#ifndef OBJECTIVE_FUNC
#define OBJECTIVE_FUNC

#include <Eigen/Core>
#include <cmath>
#include <complex>

using Eigen::VectorXd;
using Eigen::VectorXcd;

typedef struct 
{
	VectorXcd M,Mx,My,Mz,Mxx,Mxy,Mxz,Myy,Myz,Mzz,Mxxx,Mxyy,Mxzz,Myxx,Myyy,Myzz,Mzxx,Mzyy,Mzzz;
} pressures_t;

typedef struct {
	double w, wx, wy, wz;
} weighs;

double objectiveFunction(pressures_t *P, weighs w, double K1, double K2, VectorXd& grad);

#endif