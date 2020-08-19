% Fermi Dirac function used for fitting Fermi edges
% Ef=Fermi edge (energy in eV), T=sample temperature, ampl=amplitude
% NOTE: Temperature is assumed to be known and is not optimized, hence passed separately to function 
% This function can be used with lsqcurvefit:
%       Define temperature          T=9; % temp in kelvin
%       Initial guess (Ef,ampl)     xi=[5.9,12000];
%       Fitting                     x=lsqcurvefit(@(x,xdata) fermifunct(x,xdata,T),xi,xdata,ydata);
%       Generate fitted y-values    yf=fermifunct(x,xdata,T);

function f = fermifunct(x,xdata,T)

kB=1.38e-23;    % Boltzmann constant
Ef=x(1);
ampl=x(2);

f=ampl./(exp((xdata-Ef)*1.602e-19./(kB*T))+1);

