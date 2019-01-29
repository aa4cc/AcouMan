function pyyy = pyyy(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
    
    pyyy = (1./(d.^7.*k.*r.*sinTheta.^7)).*(2.*exp(d.*i.*k).*P0.*yr.*(k.*r.*sinTheta.*(-1 + sinTheta.^2).*(6.*d.^2.*sinTheta.^2.*(2 + (1 - d.*i.*k).*sinTheta.^2) + ...
      (-24 + sinTheta.^2.*(-3.*(4 + 3.*sinTheta.^2) + k.*(-3.*d.^2.*i.^2.*k.*sinTheta.^2 + k.*r.^2.*(-1 + sinTheta.^2).^2 + 3.*d.*i.*(4 + 3.*sinTheta.^2)))).*yr.^2).*besselj(0, k.*r.*sinTheta) + ...
    (-48.*yr.^2 + sinTheta.^2.*(3.*d.^4.*i.^2.*k.^2.*sinTheta.^4 + (k.^2.*r.^2.*(-1 + sinTheta.^2).^2.*(8 + 7.*sinTheta.^2) + 3.*(8 + 2.*sinTheta.^2 + sinTheta.^4)).*yr.^2 - 3.*d.*i.*k.*(-8 + sinTheta.^2.*(2 + sinTheta.^2 + k.^2.*r.^2.*(-1 + sinTheta.^2).^2)).*...
         yr.^2 + d.^3.*i.*k.*sinTheta.^2.*(-12 + sinTheta.^2.*(3 + i.^2.*k.^2.*yr.^2)) - 3.*d.^2.*(-8 + sinTheta.^2.*(4 + sinTheta.^2 + k.^2.*(r.^2.*(-1 + sinTheta.^2).^2 + 2.*i.^2.*yr.^2))))).*besselj(1, k.*r.*sinTheta)));
end