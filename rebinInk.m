%% Script for creating binned k-k-E matrix from angl-angl-E matrix

function data = rebinInk(data,theta,tilt,phi,center,Ekin_limits,kx,ky)

en=data.escale;
et=en(1);
minel=1;
while et<Ekin_limits(1)
    minel=minel+1;
    et=en(minel);
end
et=en(end);
maxel=length(en);
while et>Ekin_limits(2)
    maxel=maxel-1;
    et=en(maxel);
end


en=en(minel:maxel);

[anglx,angly]=rotmat(data.xscale+theta,data.yscale+tilt,center,phi);
%[anglx,angly]=meshgrid(data.xscale,data.yscale);
[kx_,ky_]=meshgrid(kx,ky);

mat=zeros(length(en),length(kx),length(ky));

for u=1:length(en)
    [kX,kY]=anglegrid2kk(anglx,angly,en(u)); 
    temp=shiftdim(data.x(minel-1+u,:,:),1)';
    [points,val]=tovector(kX,kY,temp);
    F=TriScatteredInterp(points,val);
    mat(u,:,:)=F(kx_,ky_)';
end

data.x=mat;
data.escale=en;
data.xscale=kx;
data.yscale=ky;