function pzzz = pzzz(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
    
   pzzz = (2.*exp(d.*i.*k).*P0.*z.*(k.*r.*sinTheta.*(-6.*d.^2.*(-1 + d.*i.*k) + (-9 + k.*(-3.*d.*i.*(-3 + d.*i.*k) + k.*r.^2.*sinTheta.^2)).*z.^2).*besselj(0, k.*r.*sinTheta) + ...
    (3.*d.^2.*(-1 + k.*(d.*i.*(1 + d.*i.*k) - k.*r.^2.*sinTheta.^2)) + (3 - 3.*d.*i.*k + d.^3.*i.^3.*k.^3 + k.^2.*(7 - 3.*d.*i.*k).*r.^2.*sinTheta.^2).*z.^2).*besselj(1, k.*r.*sinTheta)))./(d.^7.*k.*r.*sinTheta);
end