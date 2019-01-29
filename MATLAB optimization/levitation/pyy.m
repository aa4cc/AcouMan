function pyy = pyy(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
    
   pyy = (1./(d.^5.*k.*r.*sinTheta.^5)).*(2.*exp(d.*i.*k).*P0.*((-k).*r.*sinTheta.*(-1 + sinTheta.^2).*(d.^2.*sinTheta.^2 + 2.*(-2 + (-1 + d.*i.*k).*sinTheta.^2).*yr.^2).*besselj(0, k.*r.*sinTheta) + ...
    (d.^2.*sinTheta.^2.*(-2 + (1 + d.*i.*k).*sinTheta.^2) - (-8 + sinTheta.^2.*(4 + sinTheta.^2 + k.*((-d.^2).*i.^2.*k.*sinTheta.^2 - d.*i.*(-4 + sinTheta.^2) + k.*r.^2.*(-1 + sinTheta.^2).^2))).*yr.^2).*besselj(1, k.*r.*sinTheta)));
end