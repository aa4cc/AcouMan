function [ o, g ] = optFunc(phases, wp, wx, wy, wz, M, Ma, Maa, Maaa, K1, K2)  
% OPTFUNC Calculates the criterion function
% [o,g] = optFunc(phases, wp, wx, wy, wz, M, Ma, Maa, Maaa, K1, K2)
% Returns the objective function and its gradient with respect to given
% phase delays. For more information on the levitation method, refer to 
% <a href="10.1038/ncomms9661">this article</a>.


%% calculate acoustic pressure
% pressure matrices
%   P    - vector of instensities 64x1
%   Pa   - matrix of first spatial derivatives 64x3 (Px = P(:,1), Py = P(:,2), Pz = P(:,3))
%   Paa  - matrix of second spatial derivatives 64x6 (Pxx = P(:,1), Pxy = P(:,2), Pxz = P(:,3), 
% Pyy = P(:,4), Pyz = P(:,5), Pzz = P(:,6); 
%   Paaa - matrix of third spatial derivatives 64x9 (Pxxx = P(:,1), Pxyy = P(:,2), Pxzz =  P(:,3), 
% Pyxx = P(:,4), Pyyy = P(:,5), Pyzz = P(:,6), Pzxx = P(:,7), Pzyy = P(:,8), Pzzz = P(:,9)

complExp = exp(1i*phases);

P = M .* complExp;
Pa = Ma .* repmat(complExp,1,3);
Paa = Maa .* repmat(complExp,1,6);
Paaa = Maaa .* repmat(complExp,1,9);

Psum = sum(P);
Pasum = sum(Pa);
Paasum = sum(Paa);
Paaasum = sum(Paaa);

g = objectiveGrad(wp,wx,wy,wz,P,Pa,Paa,Paaa,K1,K2,Psum,Pasum,Paasum,Paaasum);

 
  
%% calculate second derivatives of potential

PxzPxz = real(Paasum(:,3))^2 + imag(Paasum(:,3))^2;
PxyPxy = real(Paasum(:,2))^2 + imag(Paasum(:,2))^2;
PyzPyz = real(Paasum(:,5))^2 + imag(Paasum(:,5))^2;
  
uxx = 2*K1*(real(Pasum(:,1))^2 + imag(Pasum(:,1))^2 + real(Psum)*real(Paasum(:,1)) + imag(Psum)*imag(Paasum(:,1))) - ...
     2*K2*((real(Paasum(:,1))^2 + imag(Paasum(:,1))^2 + real(Pasum(:,1))*real(Paaasum(:,1)) + imag(Pasum(:,1))*imag(Paaasum(:,1)))+...
    (PxyPxy + real(Pasum(:,2))*real(Paaasum(:,4)) + imag(Pasum(:,2))*imag(Paaasum(:,4)))+ ...
    (PxzPxz + real(Pasum(:,3))*real(Paaasum(:,7)) + imag(Pasum(:,3))*imag(Paaasum(:,7))));
  
  
uyy = 2*K1*(real(Pasum(:,2))^2 + imag(Pasum(:,2))^2 + real(Psum)*real(Paasum(:,4)) + imag(Psum)*imag(Paasum(:,4))) - ...
    2*K2*((PxyPxy + real(Pasum(:,1))*real(Paaasum(:,2)) + imag(Pasum(:,1))*imag(Paaasum(:,2)))+...
    (real(Paasum(:,4))^2 + imag(Paasum(:,4))^2 + real(Pasum(:,2))*real(Paaasum(:,5)) + imag(Pasum(:,2))*imag(Paaasum(:,5)))+ ...
    (PyzPyz + real(Pasum(:,3))*real(Paaasum(:,8)) + imag(Pasum(:,3))*imag(Paaasum(:,8))));
  
  
uzz = 2*K1*(real(Pasum(:,3))^2 + imag(Pasum(:,3))^2 + real(Psum)*real(Paasum(:,6)) + imag(Psum)*imag(Paasum(:,6))) - ...
    2*K2*((PxzPxz + real(Pasum(:,1))*real(Paaasum(:,3)) + imag(Pasum(:,1))*imag(Paaasum(:,3)))+...
    (PyzPyz + real(Pasum(:,2))*real(Paaasum(:,6)) + imag(Pasum(:,2))*imag(Paaasum(:,6)))+ ...
    (real(Paasum(:,6))^2 + imag(Paasum(:,6))^2 + real(Pasum(:,3))*real(Paaasum(:,9)) + imag(Pasum(:,3))*imag(Paaasum(:,9))));
  
  
 
%% calculate the objective function
 
o = wp*abs(Psum)^2 - wx*uxx - wy*uyy - wz*uzz; 
  
end