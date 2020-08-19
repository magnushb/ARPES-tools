% Method for visualizing dispersive features in photoemission data
% Based on the principle of curvature

function cmat=curvatureEK(mat,angl,energy,Ca,Ce)

h=stepsize(angl);
k=stepsize(energy);
d=size(mat);
cmat=zeros(d(1)-2,d(2)-2);

for m=2:d(1)-1
    for n=2:d(2)-1
        fprima=(mat(m,n+1)-mat(m,n-1))/(2*h);
        fbisa=(mat(m,n+1)-2*mat(m,n)+mat(m,n-1))/(h^2);
        fprime=(mat(m+1,n)-mat(m-1,n))/(2*k);
        fbise=(mat(m-1,n)-2*mat(m,n)+mat(m-1,n))/(h^2);
        fbismixed=(mat(m+1,n+1)-mat(m+1,n-1)-mat(m-1,n+1)+mat(m-1,n-1))/(4*h*k);
        
        cmat(m-1,n-1)=((1+Ca*fprima^2)*Ce*fbise^2-2*Ca*Ce*fprima*fprime*fbismixed+(1+Ce*fprime^2)*Ca*fbisa^2)/((1+Ca*fprima^2+Ce*fprime^2)^(3/2));
    end
end

