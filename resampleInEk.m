% Function for resampling a angle-energy matrix in a equidistant k-E matrix
% Input:        mat = data matrix
%               angle = angle vector 1xN (from measurement)
%               energy = energy vector Mx1 (from measurement)
%               ksampl = momentum vector of resampled matrix 1xP
%               ensampl = energy vector of resampled matrix Qx1
% 
% Output:       smat = data matrix converted to momentum-energy and
%                      resampled in points defined by ksampl and ensampl
%       
% Can be used as:   smat = resampleInEk(mat,angle,energy,ksampl,ensampl);

function smat = resampleInEk(mat,angle,energy,ksampl,ensampl)

[k,energy]=angle2kgrid(angle,energy);
[ksampl ensampl]=meshgrid(ksampl,ensampl);
[points,val]=tovector(k,energy,mat);
F=TriScatteredInterp(points,val);
smat(:,:)=F(ksampl,ensampl);
smat(isnan(smat))=0;
