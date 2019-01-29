%% Preparation
% position of the levitated object [x y z]
position = [0 0 0.04]; 
%%% transducer constant [Pa.m] 
P0=5; 
%%% transducer radius 
r = 0.005; 
%%% emitted frequency
f = 40000; 
w = 2*pi*f; 
%%% sound velocity in the carrier fluid (air)
c0 = 343; 
k = w/c0; 
%%% sound velocity in the material (polystyren) 
cp = 2350; 
%%% density of the carrier fluid (air) 
rho0 = 1.2; 
%%% density of the material (polystyren) 
rhop = 29.36; 
%%% radius of the levitated particle
rp = 0.82*10^-3; 
%%% volume
Vp = 4/3*pi*rp^3; 
%%% constants from eq. (4) and (5) see <a href="10.1038/ncomms9661">this article</a>
K1 = 1/4*Vp*((1/(c0^2*rho0))-(1/(cp^2*rhop)));
K2 = 3/4*Vp*((rho0-rhop)/(w^2*rho0*(rho0+2*rhop)));
%%% optimization weighs
wp = 0.1;    % absolute pressure
wx = 1500;   % spatial derivative of potential with respect to x
wy = 1500;   % spatial derivative of potential with respect to y
wz = 100;    % spatial derivative of potential with respect to z

% transducers' coordinates
trans = linspace(-r*7,r*7,8);
[tx,ty] = meshgrid(trans,trans);
tx = reshape(tx,[64,1]);
ty = reshape(ty,[64,1]);

%%% precomputing pressure and its derivatives (with zero phase)
Ma   = complex(zeros(64,3),zeros(64,3));
Maa  = complex(zeros(64,6),zeros(64,6));
Maaa = complex(zeros(64,9),zeros(64,9));

M = p(P0,k,r,tx,ty,position);

Ma(:,1) = px(P0,k,r,tx,ty,position);
Ma(:,2) = py(P0,k,r,tx,ty,position);
Ma(:,3) = pz(P0,k,r,tx,ty,position);

Maa(:,1) = pxx(P0,k,r,tx,ty,position);
Maa(:,2) = pxy(P0,k,r,tx,ty,position);
Maa(:,3) = pxz(P0,k,r,tx,ty,position);
Maa(:,4) = pyy(P0,k,r,tx,ty,position);
Maa(:,5) = pyz(P0,k,r,tx,ty,position);
Maa(:,6) = pzz(P0,k,r,tx,ty,position);

Maaa(:,1) = pxxx(P0,k,r,tx,ty,position);
Maaa(:,2) = pxyy(P0,k,r,tx,ty,position);
Maaa(:,3) = pxzz(P0,k,r,tx,ty,position);
Maaa(:,4) = pyxx(P0,k,r,tx,ty,position);
Maaa(:,5) = pyyy(P0,k,r,tx,ty,position);
Maaa(:,6) = pyzz(P0,k,r,tx,ty,position);
Maaa(:,7) = pzxx(P0,k,r,tx,ty,position);
Maaa(:,8) = pzyy(P0,k,r,tx,ty,position);
Maaa(:,9) = pzzz(P0,k,r,tx,ty,position);

%%% objective function (compile for faster performance)
oFunc = @(phases) optFunc(phases, wp, wx, wy, wz, M, Ma, Maa, Maaa, K1, K2);
% oFunc = @(phases) optFunc_mex(phases,weights,M,K1,K2);

%% optimization
addpath('/../');
initialPhases = zeros(64,1);
gradTolerance = 0.05;
displayIter = true;
phases = BFGSsolve(oFunc,initialPhases,gradTolerance,displayIter);