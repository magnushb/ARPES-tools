% Compensate for energy dependence of k-values in spectrum
%
% Input: 
%               angle = vector with angles (row or column)
%               energy =  energy vector (row or column)               
%
% Output:
%               k = matrix with corrected k-values, has the dimensions 
%                   M x N where M=length(energy vector) and N=length(angle vector)
%               en = energy matirx (columns identical to energy vector),
%               has the same size as k, i.e. M x N
%
% Note:     The k and en matrices have the same structure as the output of
%           the MATLAB function meshgrid, [x,y]=meshgrid(xvect,yvect);, and
%           hence the output can be used in a similar way.
%
%           ex.   [k,E]=adjustk(angle,energy);
%                 plot(k,E,data);   % here data is M x N matrix.



function [k,en] = adjustk(angle,energy)


se=size(energy);
sa=size(angle);
if se(2)>1
    energy=energy';
else
end
if sa(2)>1
else
    angle=angle';
end

le=length(energy);
en=zeros(le,length(angle));
for r=1:le
    k(r,:)=angletok(angle,energy(r));
end

la=length(angle);
en=meshgrid(energy)';
en=en(:,1:la);
