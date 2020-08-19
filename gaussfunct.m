% Gauss function with given amplitude (ampl) expectation value (mu) and standard deviation (sigma) 
% This function can be used with lsqcurvefit, ex:  
%     Initial guess (ampl,mu,sigma)     x0=[4, 889.9, 0.1];
%     Fitting                           x=lsqcurvefit(@gaussfunct,x0,xdata,ydata);
%     Generate fitted y-values          yf=gaussfunct(x,xdata);

function g=gaussfunct(x,xdata)

ampl=x(1);
mu=x(2);
sigma=x(3);

g=ampl.*exp(-(xdata-mu).^2./(2*sigma^2));