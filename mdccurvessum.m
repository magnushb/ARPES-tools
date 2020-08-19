% This function sums n Lorentzians with parameters given in x.
% x-values are given in the vector xdata, which can be either a row or
% column vector. (The function returns a vector with same shape as the
% input)
%
% Input parameters:
%                     If 'ind' option is used
%
%                     x = [ amplitude 1,...,amplitude n,...
%                           ,peak pos 1,...,peak pos n,...
%                           ,width 1,...,width n,...
%                           ,background deriv,background const]
%                         
%                      If 'equal' option is used
%
%                      x = [ amplitude 1,...,amplitude n,...
%                           ,peak pos 1,...,peak pos n,...
%                           ,width,...
%                           ,background deriv,background const]
%
%
%                     xdata = x-values (either angle or k-vector)
%                     mode = two options; 'ind' or 'equal', the frist
%                            results in Lorentzians with individual widths
%                            and the latter uses the same width for all
%                     bg = background, options 'linear' gives linear
%                         (y=a*x+b) background, 'const' gives constant and 
%                         '' (empty) gives zero background.
%                     n = number of peaks to fit
%
% Output:             curve = sum of n Lorentzian functions and background
%
% Can be used with lsqcurvefit in the following way:
%           Initial guess (n=2):                xi=[a1 a2 p1 p2 w1 w2 a b]; (if 'equal' option use xi=[a1 a2 p1 p2 w a b];)
%           Set max number of iterations:       options=optimset('MaxFunEvals','ind',10000);
%           Set lower bound:                    LB=[...];
%           Set upper bound:                    UB=[...];
%           Perform fit:                        x=lsqcurvefit(@(x,xdata) mdccurvessum(x,xdata,mode,bg,n),xi,xdata,ydata,LB,UB,options);

function curve=mdccurvessum(x,xdata,mode,bg,n)

fl=0;
loren=zeros(n,length(xdata));
s=size(xdata);
if s(1)>1
    xdata=xdata';
    fl=1;
else
end

% Creating n Lorentzians with either equal or individual widths
switch lower(mode)
    case 'ind'      % individual widths
        for u=1:n
            xlo=[x(u) x(n+u) x(2*n+u)];
            loren(u,:)=lorentzfunct(xlo,xdata);
        end
    case 'equal'    % equal widths
        for u=1:n
            xlo=[x(u) x(n+u) x(2*n+1)];
            loren(u,:)=lorentzfunct(xlo,xdata);
        end
    otherwise       % use individual widths if not stated
        for u=1:n
            xlo=[x(u) x(n+u) x(2*n+u)];
            loren(u,:)=lorentzfunct(xlo,xdata);
        end
end

% Summing Lorentzian functions
lorsum=sum(loren,1);

% Creating linear background
switch lower(bg)
    case 'linear'   % if option linear background enabled
        b=x(end-1)*xdata+x(end);
    case 'const'    % if option constant background
        b=zeros(1,length(xdata))+x(end);
    otherwise       % if option '' (other than the two above)
        b=xdata*0;
end

% Summing Lorentzians and background
if fl==1
    curve=(lorsum+b)';
else
    curve=(lorsum+b);
end
    
    
    