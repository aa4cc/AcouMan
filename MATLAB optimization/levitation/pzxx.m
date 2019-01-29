function pzxx = pzxx(P0,k,r,tx,ty,pos)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    xr = x - tx;
    yr = y - ty;
    d = sqrt(xr.^2 + yr.^2 + z.^2);
    epsilon = 1e-6; % small error
    sinTheta = sqrt(xr.^2 + yr.^2)./d + epsilon;
    
    pzxx = (1./(d.^7.*k.*r.*sinTheta.^5)).*(2.*exp(d.*i.*k).*P0.*z.*(k.*r.*sinTheta.*(d.^2.*sinTheta.^2.*(1 + 2.*sinTheta.^2 + d.*i.*k.*(1 - 2.*sinTheta.^2)) + (-4 + d.^2.*i.^2.*k.^2.*sinTheta.^2.*(2 - 3.*sinTheta.^2) + d.*i.*k.*(-4 + 2.*sinTheta.^2 + 9.*sinTheta.^4) + ...
        sinTheta.^2.*(-2 - 9.*sinTheta.^2 + k.^2.*r.^2.*(-1 + sinTheta.^2).^2)).*xr.^2).*besselj(0, k.*r.*sinTheta) + (d.^2.*sinTheta.^2.*(-2.*(1 + d.*i.*k) + (-1 + k.*(d.*i.*(1 + d.*i.*k) + k.*r.^2)).*sinTheta.^2 - k.^2.*r.^2.*sinTheta.^4) + ...
      (8 + 8.*d.*i.*k - (-4 + k.*(4.*d.*i.*(1 + d.*i.*k) + k.*(3 + d.*i.*k).*r.^2)).*sinTheta.^2 + (3 - 3.*d.*i.*k + d.^3.*i.^3.*k.^3 + 4.*k.^2.*(-1 + d.*i.*k).*r.^2).*sinTheta.^4 + k.^2.*(7 - 3.*d.*i.*k).*r.^2.*sinTheta.^6).*xr.^2).*besselj(1, k.*r.*sinTheta)));
end
