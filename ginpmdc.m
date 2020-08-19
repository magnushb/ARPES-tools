% Plot and return MDC at point provided by ginput
%
% Input:
%               mat = data matrix
%               n = number of rows to interate over
%
% Output: 
%               mdc = MDC vector
%               The script draws the MDC (matrix element as x-values)
%

function mdc = ginpmdc(data,n)

s=size(data);
figure;pcolor(data);shading interp;colormap(jet(256));hold on
g=ginput(1);
mdc=sum(data(round(g(2))-(n-1)/2:round(g(2))+(n-1)/2,:),1);
line([0 s(2)],[g(2) g(2)])

figure;plot(mdc);title('MDC')

mdc=[g(2) mdc];