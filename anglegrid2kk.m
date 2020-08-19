%%% transforms an 2D angle grid to k-k grid
%%% Use as: [kx,ky] = anglegrid2kk(X,Y,Ekin)

function [kx,ky] = anglegrid2kk(X,Y,Ekin)

[th,rho]=cart2pol(X,Y);
k=angletok(rho,Ekin);
[kx,ky]=pol2cart(th,k);