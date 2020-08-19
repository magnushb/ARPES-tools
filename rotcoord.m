% Rotates coordinate (x,y) around a given center (xc,yc) with angle phi
% in cartesian coordinate system OR around the z-axis in a polar
% (cylindrical) coordinate system (rho=0)
%
% Input:
%               x = coordinates (single coordinates, not several, i.e. x=[xi yi])
%               phi = rotate angle in degrees, positive angle=clockwise
%               xc = coordinates of rotation center ( xc=[xc yc] )
%               
%
% Output: 
%               xp = new coordinates after rotation (same format as input)
%

function xp = rotcoord(x,phi,xc)

s=size(x);
if s(1)>1       % flipping x to row vector if input is column vector
    flx=1;
    x=x';
else
    flx=0;
end

s=size(xc);
if s(1)>1       % flipping xc to row vector if input is column vector    
    xc=xc';
else
end

if length(x(:,1))==1
R=[cos(phi*pi/180) -sin(phi*pi/180);
   sin(phi*pi/180) cos(phi*pi/180)];
xp=(x-xc)*R+xc;
else
    x=x';
    R=[cos(phi*pi/180) -sin(phi*pi/180);
       sin(phi*pi/180) cos(phi*pi/180)];
    for t=1:length(x(:,1))
        xp(t,:)=(x(t,:)-xc)*R+xc;
    end
    xp=xp';
end
   

if flx==1
    xp=xp';
else
end


