% % Function for embedding a matrix in a larger one. The values of the
% % elements in the larger matrix can be set arbitrarlty, however all
% % elements will have the same values. For instance, a 20x20 matrix with
% % data points can be embedded in a 50x50 matrix containing only zeros.
% %
% % Input:           mat        = original matrix which shall be embedded (2D)
% %                  center_mat = center "pixel" in original matrix [row,col]
% %                  dim_emb    = dimensions of the larger matrix (in
% %                               elements, pixels) [rows,columns]
% %                  center_emb = "pixel" in embedding matrix which should
% %                               be matched with the center_mat pixel of the original
% %                               matrix [row,col]
% %                  val_emb    = values of the elements in the larger matrix
% %
% %
% % Output:          mat_emb    = resulting matrix
% %
% % Can be used as:  mat_emb = embedd(mat,center_mat,dim_emb,center_emb,val_emb);

function mat_emb = embedd(mat,center_mat,dim_emb,center_emb,val_emb)

sm=size(mat);                                   % find size of original matrix
mat_emb=zeros(dim_emb(1),dim_emb(2))+val_emb;   % create large matrix of zeros

% place original matrix into large one, matching their given centerpositions
mat_emb(center_emb(1)-center_mat(1)+1:center_emb(1)+sm(1)-center_mat(1),center_emb(2)-center_mat(2)+1:center_emb(2)+sm(2)-center_mat(2))=mat;

