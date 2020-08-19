% Returns the step size of a vector
% Input:
%          vector = N x 1 (or 1 x N) vector with equally spaces datapoints
%
% Output: 
%          ss = step size
%
% Can be used as:
%                   ssize=stepsize(vector);

function ss=stepsize(vector)

if length(vector)>1
        ss1=abs(vector(end)-vector(end-1));
        ss2=abs(vector(2)-vector(1));
        if ss1==ss2
            ss=ss1;
        else
            ss='Nonlinear stepsize?';
        end
else
       ss='Too few elements in vector'; 
end
