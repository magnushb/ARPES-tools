function matsn=backsub(mat,x1,x2)
matcn=matnorm(mat(:,x1:x2));
bg=sum(matcn,2);
matsn=matnorm(repmat(bg,1,size(matcn,2)));
matsn=matcn-matsn;
pcolor(matsn), shading interp
%pinkcolormap, colorbar
