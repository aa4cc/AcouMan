function pz = pz(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
   
    pz = (2.*exp(d.*i.*k).*P0.*z.*((-r).*sinTheta.*besselj(0, k.*r.*sinTheta) + ((1 + d.*i.*k).*besselj(1, k.*r.*sinTheta))./k))./(d.^3.*r.*sinTheta);

end
