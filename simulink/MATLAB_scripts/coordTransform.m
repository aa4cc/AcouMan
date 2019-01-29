function [ x ,y ] = coordTransform( H,A,correction )
homCoords = H*[A;1];
euklidCoords = homCoords/homCoords(3)*correction;
x = euklidCoords(1);
y = euklidCoords(2);
end

