%% Add folders to path
addpath('system_object/bfgs','system_object/newGenerator','MATLAB_scripts');
%% Load constants
load('controller_constants/BOD/completeModel.mat');
load('controller_constants/BOD/LQRcoefs.mat');
load('controller_constants/BOD/singleCoordinateModel.mat');