function p = p(P0,k,r,tx,ty,pos)
    x = pos(:,1);
    y = pos(:,2);
    z = pos(:,3);
    xr = x - tx;
    yr = y - ty;
    epsilon = 1e-6; % small error
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;    
    
    p = (2.*exp(d.*1j.*k).*P0.*besselj(1, k.*r.*sinTheta))./(d.*k.*r.*sinTheta);
end