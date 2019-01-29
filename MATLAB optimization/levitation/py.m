function py = py(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
    
    py = (2.*exp(d.*i.*k).*P0.*yr.*((sinTheta - sinTheta.^3).*besselj(0, k.*r.*sinTheta) + ((-2 + (1 + d.*i.*k).*sinTheta.^2).*besselj(1, k.*r.*sinTheta))./(k.*r)))./(d.^3.*sinTheta.^3);

end

