% Fits a number (n) of Lorentzians (and linear background) to a given MDC
% Input arguments: 
%                   xdata = angle or k vector (m x 1 or 1 x m in size)
%                   ydata = counts at points given in xdata
%                   mode = either 'ind' or 'equal', first uses individual
%                          widths for the Lorentzians the latter uses the
%                          same for all
%                   bg = background, options 'linear' gives linear
%                       (y=a*x+b) background, 'const' gives constant and 
%                       '' (empty) gives zero background.
%                   N = number of points in fitted curves
%
% The function plots the data ( plot(xdata,ydata) ) and uses ginput to
% collect number (n) of Lorentzians to fit and initial guesses to their 
% peak positions.
%
% Output: 
%                   ampl = amplitude of Lorentzians
%                   peaks = peak positions for the Lorentzians
%                   FWHMs = full width at half max for the Lorentzians
%                   a = derivative of constant background (y=a*x+b)
%                   b = constant in constant background (y=a*x+b)
%                   angle = generated angle (or k) vector with N elements
%                   fits = a matrix containing the individual function
%                          values for the fitted Lorentzians in the points
%                          defiend by the new angle vector (hence dim n x N)
%
% Can be used in the following way:
%           [ampl,peaks,FWHMs,a,b,angle,fits]=mdcfit(xdata,ydata,'equal','const',1000)

function [ampl,peaks,FWHMs,a,b,angle,fits]=mdcfit(xdata,ydata,mode,bg,N)

% Get number of peaks and peak position guesses
f1=figure;plot(xdata,ydata);xlabel('angle or momentum');ylabel('counts');title('Click where you think there should be a peak')
g=ginput;close(f1)
n=length(g(:,1));    	% number of peaks
pp=g(:,1);              % peak position initial guesses  

% Lorentzian amplitudes initial guess
lampl=g(:,2);

% Initial guess for widths of lorentzians, 5% of xdata range
%hw=ones(1,length(pp));
hw=ones(1,length(pp))*(max(xdata)-min(xdata))*0.05; 

% Determining background guess
leftav=mean(ydata(1:floor(length(ydata)*0.1)));
rightav=mean(ydata(end-floor(length(ydata)*0.1)+1:end));
back=mean([leftav rightav]);

% Initial guess for linear background (y=ax+b)
switch lower(bg)
    case 'linear'   % it option linear background enabled
        a=0;        % linear derivative
        b=back;     % constant
    case 'const'    % constant background enabled
        a=0;
        b=back;
    otherwise       % option '' gives no backround
        a=0;
        b=0;
end

% Defining lower and upper bounds for pp and hw
pplb=min(xdata);
ppub=max(xdata);
hwlb=0.001; % 0.001                        % in inverse Ångsröm (works also if angles are used)
hwub=abs(max(xdata)-min(xdata));    % use xdata interval as upper limit

% Combined vector of initial guesses

switch lower(mode)
    case 'ind'       % fit widths of Lorentzians individually
        xi=[lampl' pp' hw a b];   % amplitude, peak position, lorentz width, a and b of linear background
        LB=[zeros(1,n) ones(1,n)*pplb ones(1,n)*hwlb -inf 0]; % the -15 comes from the +-15 deg acceptance of the WAM mode 
        UB=[ones(1,n)*inf ones(1,n)*ppub ones(1,n)*hwub inf inf];
    case 'equal'      % use same width for both Lorentzians
        xi=[lampl' pp' hw(1) a b];
        LB=[zeros(1,n) ones(1,n)*pplb hwlb -inf 0];  
        UB=[ones(1,n)*inf ones(1,n)*ppub hwub inf inf];
    otherwise       % if not specified or mis-spelled, use individual fitting  
        xi=[lampl' pp' hw a b];  
        LB=[zeros(1,n) ones(1,n)*pplb ones(1,n)*hwlb -inf 0];  
        UB=[ones(1,n)*inf ones(1,n)*ppub ones(1,n)*hwub inf inf];
end

        
% Fitting summed curve with measured data using lsqcurvefit
options=optimset('MaxFunEvals',100000,'MaxIter',50000);
x=lsqcurvefit(@(x,xdata) mdccurvessum(x,xdata,mode,bg,n),xi,xdata,ydata,LB,UB,options);

% Generating functions based on result of fit
fl=0;
xval=linspace(min(xdata),max(xdata),N);
fits=zeros(n,length(xval));
s=size(xdata);
if s(1)>1       % flipping to row vector if input is column vector
    fl=1;
else
end

switch lower(mode)  % generate Lorentzfunctions with either individual or equal widths 
    case 'ind'      % individual widths
        for k=1:n
            xl=[x(k) x(n+k) x(2*n+k)];
            fits(k,:)=lorentzfunct(xl,xval);
            FWHMs=x(2*n+1:3*n);
        end
    case 'equal'     % equal widths
        for k=1:n
            xl=[x(k) x(n+k) x(2*n+1)];
            fits(k,:)=lorentzfunct(xl,xval);
            FWHMs=x(2*n+1);
        end
    otherwise       % if not stated, use individual widths
        for k=1:n
            xl=[x(k) x(n+k) x(2*n+k)];
            fits(k,:)=lorentzfunct(xl,xval);
            FWHMs=x(2*n+1:3*n);
        end
end


if fl==1            % flipping output vector to original shape
    angle=xval';
    fits=fits';
    ampl=x(1:n);
    peaks=x(n+1:2*n);
    FWHMs=FWHMs;
else
    angle=xval;
    ampl=x(1:n)';
    peaks=x(n+1:2*n)';
    FWHMs=FWHMs';
end

a=x(end-1);
b=x(end);


