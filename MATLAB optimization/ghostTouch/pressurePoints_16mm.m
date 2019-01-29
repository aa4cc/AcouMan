function phases10 = pressurePoints_16mm(x,y,z,pressures,initialPhases)
% PRESSUREPOINTS Calculates phase delays that generate acoustic pressure at
% specified points
% phases = pressurePoints(x,y,z,pressures,initialPhases) Returns the
% computed phases. x,y,z, and pressure must be column vectors of the
% same length. It is possible to specify initial phases for the 
% optimization algorithm.

%% Preparation
%%% number of points
numPP = numel(x);
%%% reshape to column vectors
x = reshape(x,numPP,1);
y = reshape(y,numPP,1);
z = reshape(z,numPP,1);
pressures = reshape(pressures,numPP,1);
%%% transducers' constant [Pa.m]
P0=5; 
%%% transducers' diameter
r = 0.008; 
%%% emitted frequency
f = 40000; 
w = 2*pi*f; 
%%% sound velocity in the carrier fluid (air) 
c0 = 343; 
k = w/c0; 

% transducers' coordinates
trans = linspace(-r*7,r*7,8);
[tx,ty] = meshgrid(trans,trans);
tx = reshape(tx,[64,1]);
ty = reshape(ty,[64,1]);

%%% pre-calculating pressure intensities (zero phase delays)
M = complex(zeros(64,numPP),zeros(64,numPP));
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
    P = M .* repmat(complExp,1,numPP);
    sumP = sum(P);
    absSumP = abs(sumP);
    o = (absSumP-reqPress')*(absSumP'-reqPress);

    g = sum(repmat((absSumP-reqPress')./absSumP,64,1).*2.*(real(P).*repmat(imag(sumP),64,1) - imag(P).*repmat(real(sumP),64,1)), 2);
end