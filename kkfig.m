%%% Function for plotting k-k plots

function kkfig(mat,ax,ay,Ek)

[X,Y]=meshgrid(ax,ay);
[TH,R]=cart2pol(X,Y);
kR=angletok(R,Ek);
[kx,ky]=pol2cart(TH,kR);

figure;pcolor(kx,ky,mat);shading flat;
xlabel('k_x (�^{-1})')
ylabel('k_y (�^{-1})')