function matn=matnorm(mat)
[m,n] = size(mat);
for i=1:n
    matn(:,i)=mat(:,i)/sum(mat(:,i));
    %matn(i,:)=mat(i,:)/sum(mat(i,:));
end