%%% Transforms the meshgrid matrices X and Y with corresponding function
%%% values V into two vectors 'points' and 'val'. The first two-column vector gives on
%%% list form the coordinates (x,y) of the points in the mesh. The second
%%% coloumn vector gives the function values corresponding to each row in the first,
%%% i.e. to each (x,y) point.
%%%
%%% Used as:   [points,val]=tovector(x,y,z);

function [points,val]=tovector(x,y,z)

d=size(x);
line=1;
points=zeros(d(1)*d(2),2);
val=zeros(d(1)*d(2),1);
for u=1:d(1)
    for s=1:d(2)
        points(line,:)=[x(u,s) y(u,s)];
        val(line,1)=z(u,s);
        line=line+1;
    end
end
