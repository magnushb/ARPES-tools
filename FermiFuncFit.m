% Function for fitting Fermi function
% Uses a function "fermiconv.m", which concolutes the Fermi-Dirac function
% with a Gaussian, i.e. adds analyzer "spread" due to finite resolution
% 
% xdata=energy vector of measured data
% ydata=counts at point in xdata
% T=sample temperature (in kelvin)
% Ef=initial guess for Fermi energy
% sigma=initial guess for standard deviation (half the energy resolution)
%
% Returns:  xdata (same as input), FDdata (fitted, convoluted FDdata),
%           Ef (fitted Fermi energy), sigma (fitted)
%           and gampl (fitted amplitude of Gaussian)
% Can be used:
%           Define sample temp in Kelvin            T=9;
%           Initial Fermi energy guess in eV        Ef=5.92;
%           Initial std deviation guess in eV       sigma=0.001;
%           Calling function                        [xdata,FDdata,Ef,sigma,gampl]=FermiFuncFit(xdata,ydata,T,Ef,sigma);


function [xdata,FDdata,Ef,sigma,gampl]=FermiFuncFit(xdata,ydata,T,Ef,sigma,varargin)

% Finding initial amplitude guess
nrav=floor(length(ydata)*0.15);
amplleft=sum(ydata(1:nrav))/nrav;
gaussampl=1;

% Fitting
options=optimset('MaxFunEvals',5000);
xi=[Ef,sigma,gaussampl]; % initial guess Fermi energy, width of gaussian, amplitude

% Use entire data set or choose to disregard a certain interval
if numel(varargin)==0
    %x=lsqcurvefit(@(x,xdata) fermiconv(x,xdata,amplleft,T),xi,xdata,ydata,[0 0 0],[inf inf inf],options);
    x=lsqnonlin(@(x) fermifitdiff(x,xdata,ydata,amplleft,T),xi,[0 0 0],[inf inf inf],options);
else
    x=lsqnonlin(@(x) fermifitdiff(x,xdata,ydata,amplleft,T,varargin),xi,[0 0 0],[inf inf inf],options);
end

FDdata=fermiconv(x,xdata,amplleft,T);
Ef=x(1);
sigma=x(2);
gampl=x(3);


