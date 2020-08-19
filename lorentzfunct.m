% Lorentzian function, x0=location parameter (offset from zero), w=scale
% parameter, ampl=amplitude
% This function can be used with lsqcurvefit:
%       Initial guess (ampl,x0,w)        xi=[100 250 10];
%       Fitting                     x=lsqcurvefit(@lorentzfunct,xi,xdata,ydata);
%       Generate fitted y-values    yf=lorentzfunct(x,xdata)

function Fl=lorentzfunct(x,xdata)

ampl=x(1);
x0=x(2);
w=x(3);

Fl=ampl.*((1/pi)*(0.5*w))./((xdata-x0).^2+(0.5*w)^2);
