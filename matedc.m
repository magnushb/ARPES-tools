% Returns EDCs for the matrix. User can specify step size between EDCs and
% how many columns should be summed over for each EDC. 
%
%   Use as :   edcs = matedc(mat,steps,integr,varargin);
%
% There are 4 different ways of using this function
%       1) edcs = matedc(mat,steps,integr);
%           where:      mat = data matrix
%                       steps = step size between EDCs
%                       integr = how many colums to integrate over
%
%           This alternative starts drawing EDCs at first possible column
%           and steps through the enrire matrix.
%
%       2) edcs = matedc(mat,steps,integr,angle0)
%           where:     angle0 = center angle
%
%           This alternative spaces the EDCs so that one EDC is drawn at
%           the specified center angle.
%
%       3) edcs = matedc(mat,steps,integr,lowlimit,highlimit)
%           where:      lowlimit = draw EDCs from this column...
%                       highlimit = ...to this colomn
%
%           This alternative draws EDCs for the range specified by the
%           given low and high limits.
%
%       4) edcs = matedc(mat,steps,integr,angle0,lowlimit,highlimit)
%          
%           This alternative draws EDCs within the given range specified by
%           the lower and upper limits and at the same time spaces them so
%           that one EDC is drawn for the center angle, angle0.


function edcs = matedc(mat,steps,integr,varargin)

s=size(mat);

% if angle=0 is specified, find correct starting pos for EDCs
if numel(varargin)==1
    a0pos=varargin{1,1};
    p=a0pos;

    while p>=(integr-1)/2+1
    fcol=p;
    p=p-steps;
    end
elseif numel(varargin)==2
    llim=varargin{1,1};
    ulim=varargin{1,2};
    fcol=llim;
    s(2)=ulim;
elseif numel(varargin)==3
    a0pos=varargin{1,1};
    llim=varargin{1,2};
    ulim=varargin{1,3};
    p=a0pos;
    
    while p>=llim
    fcol=p;
    p=p-steps;
    end
    s(2)=ulim;
    
else    % if angle=0 pos not specified start at first possible EDC
    fcol=(integr-1)/2+1;
end

n=1;
for u=fcol:steps:s(2)-(integr-1)/2
    pos(1,n)=u;
    edcs(:,n)=getedc(mat,u,integr);
    n=n+1;
end

edcs=[pos;edcs];

