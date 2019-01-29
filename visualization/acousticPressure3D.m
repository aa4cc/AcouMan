function P = acousticPressure3D(phases,xLim,xElements,yLim,yElements,zLim,zElements,varargin)
% ACOUSTICPRESSURE3D Calculates the 3D acoustic pressure field
%  P = acousticPressure3D(phases,xLim,xElements,yLim,yElements,zLim,zElements,tx,ty)
%  Returns an yElements-by-xElements-by-zElements 3D acoustic pressure
%  field with the given phase delays. Optionally, you can specify the transducer array coordiantes tx
%  and ty (default is an 8x8 array). The transducers are modeled
%  as vibrating pistons.

numvars = length(varargin);
assert(numvars==0 || numvars==2,'Incorrect number of optional input arguments. Must be two or none.')

%%% transducer radius
r = 0.005; 
if numvars==2
    numTrans = numel(varargin{1});
    assert(numel(varargin{2}) == numTrans && numel(phases) == numTrans,'phases, tx and ty must have the same size.')
    tx = reshape(varargin{1},1,1,1,numTrans);
    ty = reshape(varargin{2},1,1,1,numTrans);
else
    numTrans = 64;
    assert(numel(phases) == numTrans,'phases must have 64 elements for default transducer array.')
    % transducers' coordinates
    trans = linspace(-r*7,r*7,8);
    [tx,ty] = meshgrid(trans,trans);
    tx = reshape(tx,[1,1,1,64]);
    ty = reshape(ty,[1,1,1,64]);
end

%%% transducer constant 
P0=5; 
%%% emitted frequency
f = 40000; 
w = 2*pi*f; 
%%% sound velocity in the carrier fluid (air) 
c0 = 343; 
k = w/c0;



x = linspace(xLim(1),xLim(2),xElements);
y = linspace(yLim(1),yLim(2),yElements);
z = linspace(zLim(1),zLim(2),zElements);
[x,y,z] = meshgrid(x,y,z);

X = repmat(x,1,1,1,numTrans) - repmat(tx,yElements,xElements,zElements,1);
Y = repmat(y,1,1,1,numTrans) - repmat(ty,yElements,xElements,zElements,1);
Z = repmat(z,1,1,1,numTrans);
phi = repmat(reshape(phases,1,1,1,numTrans),yElements,xElements,zElements,1);

    d = sqrt(X.^2 + Y.^2 + Z.^2);
    sinTheta = sqrt(X.^2 + Y.^2)./d;
    dirFunc = 2*besselj(1, k.*r.*sinTheta)./(d.*k.*r.*sinTheta);
    dirFunc(isnan(dirFunc)) = 1;
    p = exp(1i*(d.*k+phi)).*P0.*dirFunc;
    P = abs(sum(p,4));
end

