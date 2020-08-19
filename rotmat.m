%%%% Rotates angle-angle matrix around given point + corrects for offsets
%%%% in the angles
%
% Input:    anglex = x angle vector
%           angley = y angle vector
%           center = coordinates corresponding to center, e.g. [ax,ay]=[-1 0]
%           rot_angle = angle in deg with which grid should be rotated,
%                       positive angle=counter clockwise
%   
% Output:   Xr = X grid after rotation and offset compensation
%           Yr = Y grid after rotation and offset compensation
%
% Can be used as:
%                   [Xr,Yr] = rotmat(anglex,angley,center,rot_angle)


function [Xr,Yr] = rotmat(anglex,angley,center,rot_angle)

[X,Y]=meshgrid(anglex-center(1),angley-center(2));
[phi,rho]=cart2pol(X,Y);
phi=phi+(rot_angle*pi/180);
[Xr,Yr]=pol2cart(phi,rho);

