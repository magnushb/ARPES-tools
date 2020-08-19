%%% Script for determining spin aperture position in I3 angle-angle spectrum when
%%% performing azimut and theta rotations
%%% NB!! Assumes that the azimut rotation axis is tilted as in the
%%% manipulator on I3. This means that the azimut does not rotate around
%%% ax=0 but around the sample normal. 

function [spin_center,slit] = I3rot(anglx_offset,phi,theta)

spincenter=[-anglx_offset 0];
lix=(-7:0.2:7);
liy=ones(length(lix))-1;

for u=1:length(lix)
    te(u,:)=rotcoord([lix(u) liy(u)],-phi,[0 0]);
end

spcrot=rotcoord([spincenter(1) spincenter(2)],-phi,[0 0]);

% rotate theta, i.e. paralell shift of line in direction defined by normal

if phi<0
    shx=theta*cos(pi/2+(phi*pi/180));
    shy=theta*sin(pi/2+(phi*pi/180));
else
    shx=theta*cos(pi-(pi/2-(phi*pi/180)));
    shy=theta*sin(pi/2-(phi*pi/180));
end

teshift(:,1)=te(:,1)+shx;
teshift(:,2)=te(:,2)+shy;
slit=teshift;

spin_center=[spcrot(1)+shx spcrot(2)+shy];



