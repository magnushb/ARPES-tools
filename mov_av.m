%%%% calculates moving average of data. Choose between average over 5,7,9
%%%% or 13 points with the relevant point as the middle point

function m=mov_av(x)

m=zeros(1,length(x));

% for n=3:1:length(x)-2
 for n=4:1:length(x)-3    
% for n=5:1:length(x)-4
% for n=7:1:length(x)-6
%     m(n)=(x(n-2)+x(n-1)+x(n)+x(n+1)+x(n+2))./5;
     m(n)=(x(n-3)+x(n-2)+x(n-1)+x(n)+x(n+1)+x(n+3)+x(n+2))./7;
%     m(n)=(x(n-4)+x(n-3)+x(n-2)+x(n-1)+x(n)+x(n+1)+x(n+4)+x(n+3)+x(n+2))./9;
%    m(n)=(x(n-6)+x(n-5)+x(n-4)+x(n-3)+x(n-2)+x(n-1)+x(n)+x(n+1)+x(n+4)+x(n+3)+x(n+2)+x(n+6)+x(n+5))./13;
end