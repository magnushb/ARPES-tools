% Function for calculating the difference between fittet Fermi function
% (convolution between gauss and Fermi func) and measured data points
% One can choose to disregard parts of the data, e.g. upper part of edge
% which can be rounded due to sample effects (not clean).
% 
% This function is used by "FermiFuncFit.m" as part of fitting fermi
% functions to measured data.
% Uses function "fermiconv.m"
%
%   Input:  
%           x= optimizing parameters, [Ef,sigma,gaussampl]
%           xdata = xscale values (entire vector even if you want to
%                   disregard parts of it)
%           ydata= counts at points defined in xdata vector
%           amplleft = scaling value for fermi function 
%           T = sample temperature
%           varargin = interval of data that you want to disregard [lower_index, upper_index]
%
%   Output:
%           d = differance between fittet function and data points. Either
%           for all data points (in the case where numel(varagin)==0) or
%           only for the data points outside the given interval

function d=fermifitdiff(x,xdata,ydata,amplleft,T,varargin)

fg=fermiconv(x,xdata,amplleft,T);

if numel(varargin)>0
    limits=varargin{1,1}{1,1};
    indlow=find(xdata<=limits(1),1,'last');
    indhigh=find(xdata<=limits(2),1,'last');
    d=[ydata(1:indlow-1);ydata(indhigh+1:end)]-[fg(1:indlow-1);fg(indhigh+1:end)];
else
    d=ydata-fg;
end


