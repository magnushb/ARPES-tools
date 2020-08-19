function mat=sumspline(data,coords)

s1=size(data.x);
s2=size(coords);

[X,Y]=meshgrid(data.xscale,data.yscale);

for t=1:s1(1)
    a=1;
    for u=1:2:s2(1)
        zi(t,a,:)=interp2(X,Y,shiftdim(squeeze(data.x(t,:,:)),1),coords(u,:),coords(u+1,:));
        a=a+1;
    end
end

mat=shiftdim(sum(zi,2),2)';
