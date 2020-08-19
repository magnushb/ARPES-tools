% % Function for creating a zero filled matrix containing elements == 'val' in
% % an area corresponding to a circle centered at the center "pixel" (element) 
% % of the matrix. The matrix has dimensions m x m (row x col) and the radius 
% % of the circle is r=(m-1)/2 (elements). Thus, the circle will completely
% % fill the matrix along the vertical and horizontal directions.
% % 
% % Input:     radius      = radius of circle in "pixels", or matrix elements
% %            fill_val    = element values of the circle
% %
% % Output:    mat         = matrix containing a circle centered in the
% %                          matrix and with values given by fill_val
% %
% % Can be used as:  mat = circleinmat(radius,fill_val);

function mat = circleinmat(radius,fill_val)

m=(radius-1)*2+1;   % defining the matrix dimensions based on the radius
mat=zeros(m,m);   % generating zero valued matrix
center_index=[radius,radius];

[X,Y]=meshgrid(1:m,1:m);
X=X-center_index(1);
Y=Y-center_index(2);
R=sqrt(X.^2+Y.^2);
R=R-radius;

for a=1:m
    for b=1:m
        if R(a,b)<=0
            mat(a,b)=fill_val;
        else
        end
    end
end



