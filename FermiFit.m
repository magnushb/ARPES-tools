% Script for fitting fermi edges to get resolution of spectrometer

%% load data

load resdata
energy=resdata(:,1);
ccounts=resdata(:,2);


%% Perform fit

T=9;  % sample temp in kelvin
Ef=5.94; % Ef guess (in eV)
sigma=0.001; % sigma guess (in eV)

[xdata,FDdata,Ef,sigma,gampl]=FermiFuncFit(energy',counts',T,Ef,sigma);


%% Plot fitted data

figure;plot(energy,FDdata)
hold on
plot(energy,counts,'r.')


%% Resolution (FWHM of Gaussian)

res=2*sqrt(2*log(2))*sigma