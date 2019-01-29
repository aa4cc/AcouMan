function pzz = pzz(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
    
    pzz = (2.*exp(d.*i.*k).*P0.*((-k).*r.*sinTheta.*(d.^2 + 2.*(-1 + d.*i.*k).*z.^2).*besselj(0, k.*r.*sinTheta) + (d.^2.*(1 + d.*i.*k) + (-1 + k.*(d.*i.*(1 + d.*i.*k) - k.*r.^2.*sinTheta.^2)).*z.^2).*besselj(1, k.*r.*sinTheta)))./(d.^5.*k.*r.*sinTheta);
end