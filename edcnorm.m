% Script for normalizing each EDC in a 3D angle-angle-energy matrix to the
% total sum of the EDC

function datan =  edcnorm(data)

s=size(data.x);

for u=1:s(2)
    for p=1:s(3)
        data_(:,u,p)=data.x(:,u,p)./sum(data.x(:,u,p),1);
    end
end

datan=data;
datan.x=data_;