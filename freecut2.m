%function [matpoints,xs,ys]=freecut2(mat)
function freeslice=freecut2(mat)
%load Bidata4

%[data_b,ev,ax,ay]=bindata3(data,vector_energy,vector_x_angle,vector_y_angle,2,2,2);


%rounded_x = round(2*x)/2;
%rounded_x = round(4*3.63)/4

% Locating Fermi edge by finding max neg derivative
angle_int=shiftdim(sum(sum(mat,1),2));
[minval,minind]=min(diff(angle_int));
[xs,ys,es]=size(mat);

% Sum energi slices, approx +/- 10% of matrix energy dim around Ef
sli=sum(mat(:,:,minind-round(0.05*es):minind+round(0.05*es)),3);

figure
pcolor(sli)
%imagesc(flipud(sli))
shading interp
hold on
% Initially, the list of points is empty.
xy = [];
n = 0;
% Loop, picking up the points.
disp('Left mouse button picks points.')
disp('Right mouse button picks last point.')
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'ro')
    n = n+1;
    xy(:,n) = [xi;yi];
end

% Spline interpolation of curve using finer spacing.
t = 1:n;
ts = linspace(1,n,xs*2);
xys = spline(t,xy,ts);

% Plot the interpolated curve.
plot(xys(1,:),xys(2,:),'b-','linewidth',2);
hold off

points=round(xys);


% Removing multiples of matrix points
matpoints=points(:,1);
m=1;
for r=1:length(points)
    if points(1,r)==matpoints(1,m) && points(2,r)==matpoints(2,m)
    else
        m=m+1;
        matpoints(:,m)=[points(1,r);points(2,r)];
    end
end
    
figure
plot(matpoints(1,:),matpoints(2,:),'.')
axis([0 xs 0 ys])


for u=1:length(points)
    freeslice(:,u)=mat(points(2,u),points(1,u),:);
end

figure
pcolor(freeslice)
%imagesc(flipud(freeslice))
shading interp
