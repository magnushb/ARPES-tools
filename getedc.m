% Get EDC (Energy Distribution Curve) for data matrix at given column
%
% Input:        
%               mat = 2D data matrix with dimensions M x N
%               c = matrix column where MDC should be drawn
%               n = total number of integrated columns, should be symmetric
%                   around c (i.e. n = odd)
%
% Output:       
%               edc = edc vector (integrated over n columns)
%               

function edc = getedc(mat,c,n)

edc=sum(mat(:,c-(n-1)/2:c+(n-1)/2),2);