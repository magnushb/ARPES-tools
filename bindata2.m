% Bins the 2D matrix by binning nrow matrix values along row and ncol matrix values
% along col 
% If matrix is a 6*8 matrix then bindata(matrix,2,2) will result in a
% 3*4 matrix

%function [db]=bindata(matrix,nx,ny)
function db=bindata2(matrix,nrow,ncol)
[row,col]=size(matrix);
srow=floor(row/nrow);
scol=floor(col/ncol);

for j=1:scol
    dbt(:,j)=sum(matrix(:,j*ncol-ncol+1:j*ncol),2);
end


for i=1:srow
    db(i,:)=sum(dbt(i*nrow-nrow+1:i*nrow,:),1);
end