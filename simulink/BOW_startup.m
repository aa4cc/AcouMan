%% Add folders to path
addpath('system_object/bfgs','system_object/newGenerator','system_object/loader','MATLAB_scripts','../raspi-ballpos/matlabSystemObject');
%% Load constants
load('controller_constants/BOW/f2p.mat');
load('controller_constants/BOW/PID_v2.mat');
load('controller_constants/BOW/stateSpace.mat');
load('controller_constants/BOW/kalman.mat');
load('controller_constants/BOW/trajectory_5mm.mat');

%% Parameters
%%% Particle radius
Rp = 4e-3;

%%% State feedback
% Extended state-space model (with integral state)
Fext = [F zeros(6,1); Cnd 1];
Gext = [G;0];
Cext = [0 0 1];
% % Show current poles
% eig(Fext) 
% Desired pole placement
poles = [0.965 0.965 0.945 0 0 0 0];
Kext = acker(Fext,Gext,poles);
% State feedback vector
K = Kext(1:6);
% Integrator constant
K_i = Kext(7)*50;