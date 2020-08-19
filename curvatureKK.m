% Method for visualizing dispersive features in photoemission data
% Based on the principle of curvature

function cmat=curvatureKK(mat,angl1,angl2,C0)

h=stepsize(angl1);
k=stepsize(angl2);
d=size(mat);
cmat=zeros(d(1)-2,d(2)-2);

for m=2:d(1)-1
    for n=2:d(2)-1
        fprima1=(mat(m,n+1)-mat(m,n-1))/(2*h);
        fbisa1=(mat(m,n+1)-2*mat(m,n)+mat(m,n-1))/(h^2);
        fprima2=(mat(m+1,n)-mat(m-1,n))/(2*k);
        fbisa2=(mat(m-1,n)-2*mat(m,n)+mat(m-1,n))/(h^2);
        fbismixed=(mat(m+1,n+1)-mat(m+1,n-1)-mat(m-1,n+1)+mat(m-1,n-1))/(4*h*k);
        
        cmat(m-1,n-1)=((C0+fprima1^2)*fbisa2^2-2*fprima1*fprima2*fbismixed+(C0+fprima2^2)*fbisa1^2)/((C0+fprima1^2+fprima2^2)^(3/2));
    end
end

