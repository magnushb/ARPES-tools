%% Data normalization, 3D cube, normalizes each energy column 

function nmat=datanorm(mat)

s=size(mat);

for m=1:s(2)
    for n=1:s(3)
        nmat(:,m,n)=mat(:,m,n)./sum(mat(:,m,n),1);
    end
end