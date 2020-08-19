% Convoluting Fermi function with Gaussian
% x=optimizing parameters
% Ef=Fermi energy of Fermi function, gaussampl=amplitude of Gaussian and sigma=standard deviation 
% are the optimizing parameters. The temperature of the sample (used in the Fermi function) is given 
% as a constant parameter and is not optimized.
% Can be used with lsqcurvefit:
%           Set max number of iterations            options=optimset('MaxFunEvals',5000);
%           Initial guess                           xi=[Ef,sigma,gaussampl]; 
%           Fitting                                 x=lsqcurvefit(@(x,xdata) fermiconv(x,xdata,amplleft,T),xi,xdata,ydata,[0 0 0],[inf inf inf],options);
%           Creating fitted data vector             FDdata=fermiconv(x,xdata,amplleft,T);

function fg=fermiconv(x,xdata,amplleft,T)

Ef=x(1);
sigma=x(2);
gaussampl=x(3);

% Extend x range to avoid edge effects of convolution
xmod=[(fliplr(xdata(1)-(xdata(2)-xdata(1)):-(xdata(2)-xdata(1)):xdata(1)-(xdata(end)-xdata(1))/2))';xdata;(xdata(end)+(xdata(2)-xdata(1)):(xdata(2)-xdata(1)):xdata(end)+(xdata(end)-xdata(1))/2)'];
xtemp=xmod-median(xdata);

fermi=fermifunct([Ef,amplleft],xmod,T);
gauss=gaussfunct([gaussampl 0 sigma],xtemp);

fg=conv(fermi,gauss,'same');

% Return same length as input vector (undo extension above)
lo=length(xdata);
lmo=length(xmod);
ldiff=lmo-lo;
fg=fg(ldiff/2+1:end-ldiff/2);

