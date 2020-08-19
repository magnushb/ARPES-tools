%%
pname='C:\Users\magnus\Desktop\maxlab jan 2011\Bi2Se3#2\FS_10eV';
l=ls(pname);
s=size(l);
order=[11:21,1:10];%,11]%,12,13,14,15,16,17,1,2];
%order=[10 11 12 13 14 15 16 17 18 19 9 7 8 6 5 4 3 2 1];
for r=1:s(1)-2%-8
    [angl,mat] = nrfile( strcat(pname,'\',l(r+2,:)));
    mattot(:,:,order(r))=mat;
end

no=sum(sum(mattot));
no=shiftdim(no);

for u=1:length(no)
    mat(:,:,u)=mattot(:,:,u)./no(u);
end

%figure;pcolor(shiftdim(sum(mat(187:189,:,:),1)));shading interp;colormap hot(256)
figure;pcolor(shiftdim(sum(mat(145:155,:,:),1)));shading interp;colormap hot(256)
%figure;pcolor(shiftdim(sum(mat(25:end,127:147,:),2),2)');shading interp;colormap hot
figure;pcolor(shiftdim(sum(mat(25:end,140:150,:),2),2)');shading interp;colormap hot(256)
%figure;pcolor(mat(25:end,:,10));shading interp;colormap hot(256)
figure;pcolor(mat(25:end,:,9));shading interp;colormap hot(256)

%%
mat(:,:,10)=mat;
s=size(shiftdim(mat(:,:,10),2));
for y=1:s(2)
    te1(:,y)=smooth(mat(:,y,10));
end

for p=1:s(1)
    te(p,:)=smooth(te1(p,:));
end

te=te./1e-6;

figure;pcolor(mat(:,:,10));shading interp;colormap gray
figure;pcolor(te);shading interp;colormap gray
%%
te=te./max(max(te));
%te=mat;
figure;hold on
ad=0;
for w=3:5:s(2)-5
    plot(sum(te(:,w:w+5),2)+ad)
    ad=ad+4000;
end
    
%%
s=size(mat)
ad=0;
figure;hold on
for j=3:5:s(1)-5
    plot(sum(mat(j:j+5,:),1)+ad)
    ad=ad+7000;
end

%%
mat(:,:,1)=mat02./no(1);
mat(:,:,2)=mat01./no(2);
mat(:,:,3)=mat1./no(3);
mat(:,:,4)=mat2./no(4);
mat(:,:,5)=mat3./no(5);
mat(:,:,6)=mat4./no(6);
mat(:,:,7)=mat5./no(7);
mat(:,:,8)=mat6./no(8);
mat(:,:,9)=mat7./no(9);
mat(:,:,10)=mat7./no(10);
mat(:,:,11)=mat9./no(11);
mat(:,:,11)=mat10./no(11);

%%
mat(:,:,1)=mat02;
mat(:,:,2)=mat01;
mat(:,:,3)=mat1;
mat(:,:,4)=mat2;
mat(:,:,5)=mat3;
mat(:,:,6)=mat4;
mat(:,:,7)=mat5;
mat(:,:,8)=mat6;
mat(:,:,9)=mat7;
mat(:,:,10)=mat8;
mat(:,:,11)=mat9;
mat(:,:,12)=mat10;