function phases10 = pressurePoints(x,y,z,pressures,varargin)
% PRESSUREPOINTS Calculates phase delays that generate acoustic pressure at
% specified points
% phases = pressurePoints(x,y,z,pressures,initialPhases,tx,ty) Returns the
% computed phases. x,y,z, and pressure must be column vectors of the
% same length. It is possible to specify initial phases for the 
% optimization algorithm, as well as the transducer array coordinates.
% Initial phases are zeros by default, transducers are arranged in 8x8
% array by default.

%% Process input arguments
numvars = length(varargin);
assert(numvars == 0 || numvars == 1 || numvars == 3,'Incorrect number of optional input arguments. Must be one, three or none.')
r = 0.005; 
numTrans = 64;
if numvars == 1
    assert(numel(varargin{1}) == 64, 'initialPhases must have 64 elements with default transducer array.');
    initialPhases = reshape(varargin{1},64,1);    
    trans = linspace(-r*7,r*7,8);
    [tx,ty] = meshgrid(trans,trans);
    tx = reshape(tx,[64,1]);
    ty = reshape(ty,[64,1]);
elseif numvars == 3    
    initialPhases = reshape(varargin{1},numel(varargin{1}),1);
    tx = reshape(varargin{2},numel(varargin{2}),1);
    ty = reshape(varargin{3},numel(varargin{3}),1);
    numTrans = numel(varargin{1});
    assert(numel(tx) == numTrans && numel(ty) == numTrans,'initialPhases,tx and ty must have the same size.');
else
    initialPhases = zeros(64,1);
    trans = linspace(-r*7,r*7,8);
    [tx,ty] = meshgrid(trans,trans);
    tx = reshape(tx,[64,1]);
    ty = reshape(ty,[64,1]);
end
%% Preparation
%%% number of points
numPP = numel(x);
assert(numel(y)==numPP && numel(z)==numPP && numel(pressures)==numPP,'x,y,z and pressures must have the same size.')
%%% reshape to column vectors
x = reshape(x,numPP,1);
y = reshape(y,numPP,1);
z = reshape(z,numPP,1);
pressures = reshape(pressures,numPP,1);
%%% transducers' constant [Pa.m]
P0=5; 
%%% emitted frequency
f = 40000; 
w = 2*pi*f; 
%%% sound velocity in the carrier fluid (air) 
c0 = 343; 
k = w/c0; 

%%% pre-calculating pressure intensities (zero phase delays)
M = complex(zeros(numTrans,numPP),zeros(numTrans,numPP));
for idx = 1:numPP
    M(:,idx) = p(P0,k,r,tx,ty,[x(idx) y(idx) z(idx)]);
end

%%% objective function
oFunc = @(phases) optPress(phases,M,pressures);

%% optimization
gradTolerance = 0.5;
displayIter = false;
phases10 = BFGSsolve(oFunc,initialPhases,gradTolerance,displayIter);

end

function [o,g] = optPress(phases, M, reqPress)
% OPTPRESS Calculates objective function and its gradient
    complExp = exp(1j*phases);
    numPP = numel(reqPress);
    numTrans = size(M,2);
    P = M .* repmat(complExp,1,numPP);
    sumP = sum(P);
    absSumP = abs(sumP);
    o = (absSumP-reqPress')*(absSumP'-reqPress);

    g = sum(repmat((absSumP-reqPress')./absSumP,numTrans,1).*2.*(real(P).*repmat(imag(sumP),numTrans,1) - imag(P).*repmat(real(sumP),numTrans,1)), 2);
end