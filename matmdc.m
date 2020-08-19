% Returns MDCs for the matrix. User can specify step size between MDCs and
% how many rows should be summed over for each MDC. 
%
%   Use as :   mdcs = matmdc(mat,steps,integr,varargin);
%
% There are 4 different ways of using this function
%       1) mdcs = matmdc(mat,steps,integr);
%           where:      mat = data matrix
%                       steps = step size between MDCs
%                       integr = how many rows to integrate over
%
%           This alternative starts drawing MDCs at first possible row
%           and steps through the enrire matrix.
%
%       2) mdcs = matmdc(mat,steps,integr,e0)
%           where:     e0 = center energy
%
%           This alternative spaces the MDCs so that one MDC is drawn at
%           the specified center energy.
%
%       3) mdcs = matmdc(mat,steps,integr,lowlimit,highlimit)
%           where:      lowlimit = draw MDCs from this row...
%                       highlimit = ...to this row
%
%           This alternative draws MDCs for the range specified by the
%           given low and high limits.
%
%       4) mdcs = matmdc(mat,steps,integr,e0,lowlimit,highlimit)
%          
%           This alternative draws MDCs within the given range specified by
%           the lower and upper limits and at the same time spaces them so
%           that one MDC is drawn for the center energy, e0.


function mdcs = matmdc(mat,steps,integr,varargin)

s=size(mat);

% if Fermi level is specified, find correct starting pos for MDCs
if numel(varargin)==1
    e0pos=varargin{1,1};
    p=e0pos;

    while p>=(integr-1)/2+1
    fline=p;
    p=p-steps;
    end
elseif numel(varargin)==2
    llim=varargin{1,1};
    ulim=varargin{1,2};
    fline=llim;
    s(1)=ulim;
elseif numel(varargin)==3
    e0pos=varargin{1,1};
    llim=varargin{1,2};
    ulim=varargin{1,3};
    p=e0pos;
    
    while p>=llim
    fline=p;
    p=p-steps;
    end
    s(1)=ulim;
        
else    % if fermi pos not specified start at first possible mdc
    fline=(integr-1)/2+1;
end

n=1;
for u=fline:steps:s(1)-(integr-1)/2
    pos(n,1)=u;
    mdcs(n,:)=getmdc(mat,u,integr);
    n=n+1;
end

mdcs=[pos mdcs];

