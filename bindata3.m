% Bins the 3D matrix by binning nx matrix values along x and ny matrix values
% along y and nz values along z
% If matrix is a 6*6*9 matrix then bindata(matrix,2,2,3) will result in a
% 3*3*3 matrix

%function [db,anglex_new,angley_new,energy_new]=bindata3(matrix,anglex,angley,energy,nx,ny,nz)
function db=bindata3(matrix,nx,ny,nz)
[x,y,z]=size(matrix);
sx=floor(x/nx);
sy=floor(y/ny);
sz=floor(z/nz);

for k=1:sz
    dbt(:,:,k)=sum(matrix(:,:,k*nz-nz+1:k*nz),3);
    %energy_new(k)=energy(2*k-1);
end


for j=1:sy
    dbt2(:,j,:)=sum(dbt(:,j*ny-ny+1:j*ny,:),2);
    %angley_new(j)=angley(2*j-1);
end


for i=1:sx
    db(i,:,:)=sum(dbt2(i*nx-nx+1:i*nx,:,:),1);
    %anglex_new(i)=anglex(2*i-1);
end
    
