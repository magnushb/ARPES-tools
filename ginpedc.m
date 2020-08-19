% Plot and return EDC at point provided by ginput
%
% Input:
%               mat = data matrix
%               n = number of columns to interate over
%
% Output: 
%               edc = EDC vector 
%               The script draws the MDC (matrix element as x-values)
%

function edc = ginpedc(data,n)

s=size(data);
figure;pcolor(data);shading interp;colormap(jet(256));%hold on
g=ginput(1);
edc=sum(data(:,round(g(1))-(n-1)/2:round(g(1))+(n-1)/2),2);
line([g(1) g(1)],[0 s(1)])

figure;plot(edc);title('EDC')

edc=[g(1);edc];