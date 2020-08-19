% Calculates angle-vector from k-values
% Input:  
%           k = vector or matrix with momentum in inverse Ångstrom
%           Ekin = kinetic energy in eV
%
% Output: 
%           angle = angles (vector or matrix) in degrees
%

function angle=ktoangle(k,Ekin)

m=9.11e-31;
hbar=1.055e-34;
c=1.6e-19;

angle=asin(hbar.*k./sqrt(2*m*Ekin*c)./1e-10)*180/pi;

%k=.*sin(angle.*pi./180)./hbar.*1e-10;