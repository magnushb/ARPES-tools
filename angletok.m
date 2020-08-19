% Calculates k-vector from angles
% Input:  
%           angle = vector or matrix with angles in degrees
%           Ekin = kinetic energy in eV
%
% Output: 
%           k = kvalues (vector or matrix) in inverse Ångstrom
%

function k=angletok(angle,Ekin)

m=9.11e-31;
hbar=1.055e-34;
c=1.6e-19;

k=sqrt(2*m*Ekin*c).*sin(angle.*pi./180)./hbar.*1e-10;

