% Get MDC (Momentum Distribution Curve) for data matrix at given row
%
% Input:        
%               mat = 2D data matrix with dimensions M x N
%               r = matrix row where MDC should be drawn
%               n = total number of integrated rows, should be symmetric
%                   around E (i.e. n = odd)
%
% Output:       
%               mdc = mdc vector (integrated over n rows)
%               

function mdc = getmdc(mat,r,n)

mdc=sum(mat(r-(n-1)/2:r+(n-1)/2,:),1);

