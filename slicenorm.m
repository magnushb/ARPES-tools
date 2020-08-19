% Script for normalizing each angle-energy slice to the total sum of the
% slice

function datan = slicenorm(data,d)

s=size(data.x);

if d==3
    for p=1:s(d)
            data_(:,:,p)=data.x(:,:,p)./sum(sum(data.x(:,:,p),1),2);
    end
elseif d==2
    for p=1:s(d)
            data_(:,p,:)=data.x(:,p,:)./sum(sum(data.x(:,p,:),1),3);
    end
end

datan=data;
datan.x=data_;