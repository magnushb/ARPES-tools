% Script for binnin perpendicular to freecut slice


function spoints = freebin(sliceexp,bins,varargin)

if numel(varargin)>0
    plen=0;
else
    plen=1;
end

mat=sliceexp.I{1,1};
co=sliceexp.splinecorrds;
anglx=sliceexp.xscale{1,1};
angly=sliceexp.yscale{1,1};
x=co(1,:);
y=co(2,:);
le=length(x);
d=size(mat);

if plen==1
    figure;pcolor(anglx,angly,mat);shading flat;hold on
    plot(x,y,'-')
    hold on
    axis([-15 15 -15 15])
    %axis([2 4 3 5])
    axis square
else
end

u=1;
for t=2:1:le-1
    tps(u)=t;
    diffs(:,u)=[x(t+1)-x(t-1);y(t+1)-y(t-1)]; % coords for point n+1 minus coord for point n-1
    normals(:,u)=[x(t)-diffs(2,u);y(t)+diffs(1,u);x(t)+diffs(2,u);y(t)-diffs(1,u)]; % coords to endpoints of normal to curve in point n, normal=(-dy,dx) and = (dy,-dx)
    if plen==1
        line([normals(1,u),normals(3,u)],[normals(2,u),normals(4,u)]); % draw lines
    else
    end
    ndiffs(:,u)=[normals(1,u)-normals(3,u);normals(2,u)-normals(4,u)]; % dx and dy for endpoints of normal, symmetric around point n
    %te(u,:)=polyfit([normals(1,u),normals(3,u)],[normals(2,u),normals(4,u)],1);
    u=u+1;
end

%bins=11;
dx=anglx(2)-anglx(1);
dy=angly(2)-angly(1);
%fact=1;
fact=(bins-1)/2*min(dx,dy); % uses smallest of x or y bins to set max distance for last bin
s=linspace(-fact,fact,bins);


for r=1:u-1
    a=1;
    nfact=sqrt(ndiffs(1,r)^2+ndiffs(2,r)^2)/2; % length of normal
    for p=1:2:length(s)*2-1
        spoints(p:p+1,r)=[x(tps(r))+ndiffs(1,r)/2*(s(a)/nfact);y(tps(r))+ndiffs(2,r)/2*(s(a)/nfact)];
        if plen==1
            plot(spoints(p,r),spoints(p+1,r),'.r');axis([-15 15 -15 15]);axis square
        else
        end
        a=a+1;
    end
end
    




%axis([2 4 3 5])


