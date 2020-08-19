function [C, CorrAngle] = C_ang_cross_corr(img, center, q_bounds, q_stepsize)
%%
%%
%%

if nargin == 3
    q_stepsize = 1;
end;

if length(q_bounds) == 1
    q_bounds(2) = q_bounds(1);
end;

[xdim ydim] = size(img);
[x,y]=meshgrid(-(center(2)-1):(xdim-center(2)),-(center(1)-1):(ydim-center(1)));

l=1;
for k=q_bounds(1):q_stepsize:q_bounds(2)
    mask=((x.^2+y.^2)<=k^2)-((x.^2+y.^2)<=(k-1)^2);
    data = img.*double(mask);
    data = data(mask==1);
    N = length(data);
    Iq_mean = mean(data);
    CorrAngle{l} = [0:1:N-1] * 2*pi/N;
    
    for delta=0:1:N-1
        temp = 0;
        for j=1:N
            if j+delta <= N
                index = j+delta;
            else
                index = mod(j+delta,N);
            end;
            temp = temp + data(j)*data(index);
        end; 
        temp2(delta+1) = temp;
    end;
    
    C{l} = (temp2/N - Iq_mean^2)/(Iq_mean^2);
    
    l = l + 1;
end;

