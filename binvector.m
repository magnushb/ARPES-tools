% Function for rebinning a vector
% Original vector (x) has lenght=N, n elements in the original vector will be
% binned in to one element in the new vector.
% Function starts at first element in x and bins until it reaches the end-n
% If there are too few elements to perform last bin this will be left out.
% If original vector is a column vector, the function returns the same
%
% That means: 
%               n elements in old vector are binned into one in new


function v=binvector(x,n)

v=zeros(1,floor(length(x)/n));
for j=0:floor(length(x)/n)-1
    v(j+1)=sum(x(n*j+1:n*j+n))/n;
end

[a,b]=size(x);
if a>b
    v=v';
else
end

    