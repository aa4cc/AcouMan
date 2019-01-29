#include "objFunc.h"

using namespace std;

typedef struct pressure_sums
{
	complex<double> S,Sx,Sy,Sz,Sxx,Sxy,Sxz,Syy,Syz,Szz,Sxxx,Sxyy,Sxzz,Syxx,Syyy,Syzz,Szxx,Szyy,Szzz;
};

VectorXd dotProductDiff(VectorXcd Pg, VectorXcd Pf, complex<double> sumPg, complex<double> sumPf) {
	return sumPf.imag()*Pg.real() + sumPg.imag()*Pf.real() - sumPf.real()*Pg.imag() - sumPg.real()*Pf.imag();
}

double dotProduct(complex<double> g, complex<double> f) {
	return g.real()*f.real() + g.imag()*f.imag();
}

// double potentialDiffA(pressures_t *P, struct pressure_sums s, double K1, double K2) {
// 	return 2*K1*( dotProductDiff(P->Ma,P->Ma,s.Sa,s.Sa) + dotProductDiff(P->M,P->Maa,s.S,s.Saa) )
// 		- 2*K2*( dotProductDiff(P->Mxa,P->Mxa,s.Sxa,s.Sxa) + dotProductDiff(P->Ma,P->Mxaa,s.Sa,s.Sxaa)
// 		+ dotProductDiff(P->Mya,P->Mya,s.Sya,s.Sya) + dotProductDiff(P->My,P->Myaa,s.Sy,s.Syaa)
// 		+ dotProductDiff(P->Maz,P->Maz,s.Saz,s.Saz) + dotProductDiff(P->Mz,P->Mzaa,s.Sz,s.Szaa)	);
// }
VectorXd potentialDiffX(pressures_t *P, struct pressure_sums s, double K1, double K2) {
	return 2*K1*( dotProductDiff(P->Mx,P->Mx,s.Sx,s.Sx) + dotProductDiff(P->M,P->Mxx,s.S,s.Sxx) )
		- 2*K2*( dotProductDiff(P->Mxx,P->Mxx,s.Sxx,s.Sxx) + dotProductDiff(P->Mx,P->Mxxx,s.Sx,s.Sxxx)
		+ dotProductDiff(P->Mxy,P->Mxy,s.Sxy,s.Sxy) + dotProductDiff(P->My,P->Myxx,s.Sy,s.Syxx)
		+ dotProductDiff(P->Mxz,P->Mxz,s.Sxz,s.Sxz) + dotProductDiff(P->Mz,P->Mzxx,s.Sz,s.Szxx)	);
}

VectorXd potentialDiffY(pressures_t *P, struct pressure_sums s, double K1, double K2) {
	return 2*K1*( dotProductDiff(P->My,P->My,s.Sy,s.Sy) + dotProductDiff(P->M,P->Myy,s.S,s.Syy) )
		- 2*K2*( dotProductDiff(P->Mxy,P->Mxy,s.Sxy,s.Sxy) + dotProductDiff(P->My,P->Mxyy,s.Sy,s.Sxyy)
		+ dotProductDiff(P->Myy,P->Myy,s.Syy,s.Syy) + dotProductDiff(P->My,P->Myyy,s.Sy,s.Syyy)
		+ dotProductDiff(P->Myz,P->Myz,s.Syz,s.Syz) + dotProductDiff(P->Mz,P->Mzyy,s.Sz,s.Szyy)	);
}

VectorXd potentialDiffZ(pressures_t *P, struct pressure_sums s, double K1, double K2) {
	return 2*K1*( dotProductDiff(P->Mz,P->Mz,s.Sz,s.Sz) + dotProductDiff(P->M,P->Mzz,s.S,s.Szz) )
		- 2*K2*( dotProductDiff(P->Mxz,P->Mxz,s.Sxz,s.Sxz) + dotProductDiff(P->Mz,P->Mxzz,s.Sz,s.Sxzz)
		+ dotProductDiff(P->Myz,P->Myz,s.Syz,s.Syz) + dotProductDiff(P->My,P->Myzz,s.Sy,s.Syzz)
		+ dotProductDiff(P->Mzz,P->Mzz,s.Szz,s.Szz) + dotProductDiff(P->Mz,P->Mzzz,s.Sz,s.Szzz)	);
}

VectorXd objectiveGrad(pressures_t *P, struct pressure_sums s, weighs w, double K1, double K2) {
	VectorXd Uxx = potentialDiffX(P,s,K1,K2);
	VectorXd Uyy = potentialDiffY(P,s,K1,K2);
	VectorXd Uzz = potentialDiffZ(P,s,K1,K2);

	return w.w*dotProductDiff(P->M,P->M,s.S,s.S) - w.wx*Uxx - w.wy*Uyy - w.wz*Uzz;
}

double objectiveFunction(pressures_t *P, weighs w, double K1, double K2, VectorXd& grad) {
	struct pressure_sums s;
	s.S = P->M.sum();
	s.Sx = P->Mx.sum();
	s.Sy = P->My.sum();
	s.Sz = P->Mz.sum();
	s.Sxx = P->Mxx.sum();
	s.Sxy = P->Mxy.sum();
	s.Sxz = P->Mxz.sum();
	s.Syy = P->Myy.sum();
	s.Syz = P->Myz.sum();
	s.Szz = P->Mzz.sum();
	s.Sxxx = P->Mxxx.sum();
	s.Sxyy = P->Mxyy.sum();
	s.Sxzz = P->Mxzz.sum();
	s.Syxx = P->Myxx.sum();
	s.Syyy = P->Myyy.sum();
	s.Syzz = P->Myzz.sum();
	s.Szxx = P->Mzxx.sum();
	s.Szyy = P->Mzyy.sum();
	s.Szzz = P->Mzzz.sum();

	grad = objectiveGrad(P,s,w,K1,K2);

	double Uxx = 2*K1*( dotProduct(s.Sx,s.Sx) + dotProduct(s.S,s.Sxx) )
		- 2*K2*( dotProduct(s.Sxx,s.Sxx) + dotProduct(s.Sx,s.Sxxx)
		+ dotProduct(s.Sxy,s.Sxy) + dotProduct(s.Sy,s.Syxx)
		+ dotProduct(s.Sxz,s.Sxz) + dotProduct(s.Sz,s.Szxx)	);

	double Uyy = 2*K1*( dotProduct(s.Sy,s.Sy) + dotProduct(s.S,s.Syy) )
		- 2*K2*( dotProduct(s.Sxy,s.Sxy) + dotProduct(s.Sy,s.Sxyy)
		+ dotProduct(s.Syy,s.Syy) + dotProduct(s.Sy,s.Syyy)
		+ dotProduct(s.Syz,s.Syz) + dotProduct(s.Sz,s.Szyy)	);

	double Uzz = 2*K1*( dotProduct(s.Sz,s.Sz) + dotProduct(s.S,s.Szz) )
		- 2*K2*( dotProduct(s.Sxz,s.Sxz) + dotProduct(s.Sz,s.Sxzz)
		+ dotProduct(s.Syz,s.Syz) + dotProduct(s.Sy,s.Syzz)
		+ dotProduct(s.Szz,s.Szz) + dotProduct(s.Sz,s.Szzz)	);

	return w.w*pow(abs(s.S),2) - w.wx*Uxx - w.wy*Uyy - w.wz*Uzz;
}