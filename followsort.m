% Script for sorting the elements of a vector B based on how elements in
% another vector A are shifted when sorted using the command 'sort(A)'

function [As,varargout]=followsort(A,varargin)

[As,I]=sort(A);

if numel(varargin)>1
    for r=1:numel(varargin)
        temp=varargin{1,r};
        for t=1:length(A)
            te(t,1)=temp(I(t));
        end
        varargout{1,r}=te;
    end
else
    temp=varargin{1};
    for t=1:length(A)
        te(t,1)=temp(I(t));
    end
    varargout{1}=te;
end

varargout{1,numel(varargin)+1}=I;
    
        




