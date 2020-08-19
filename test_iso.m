

matrix_dim=size(I);


face_x=100:matrix_dim(1);
face_y=100:matrix_dim(2);
face_z=1:100;%30:matrix_dim(3);

       p = patch(isosurface(x(face_x,:,:),y(face_x,:,:),z(face_x,:,:),I(face_x,:,:),10), 'FaceColor', 'red', 'EdgeColor', 'none');
       p2 = patch(isocaps(x(face_x,:,:),y(face_x,:,:),z(face_x,:,:),I(face_x,:,:),1), 'FaceColor', 'interp', 'EdgeColor', 'none');
       
       %colormap(gray(100))
       camlight; lighting gouraud%; MATERIAL DULL;
       isonormals(x(face_x,:,:),y(face_x,:,:),z(face_x,:,:),I(face_x,:,:), p);
       
       hold on
       
       p = patch(isosurface(x(:,face_y,:),y(:,face_y,:),z(:,face_y,:),I(:,face_y,:),10), 'FaceColor', 'red', 'EdgeColor', 'none');
       p2 = patch(isocaps(x(:,face_y,:),y(:,face_y,:),z(:,face_y,:),I(:,face_y,:),1), 'FaceColor', 'interp', 'EdgeColor', 'none');
       
       %colormap(gray(100))
       camlight; lighting gouraud%;MATERIAL DULL
       isonormals(x(:,face_y,:),y(:,face_y,:),z(:,face_y,:),I(:,face_y,:), p);
       
       p = patch(isosurface(x(:,:,face_z),y(:,:,face_z),z(:,:,face_z),I(:,:,face_z),10), 'FaceColor', 'red', 'EdgeColor', 'none');
       p2 = patch(isocaps(x(:,:,face_z),y(:,:,face_z),z(:,:,face_z),I(:,:,face_z),1), 'FaceColor', 'interp', 'EdgeColor', 'none');
       
       %colormap(gray(100))
       camlight; lighting gouraud
       isonormals(x(:,:,face_z),y(:,:,face_z),z(:,:,face_z),I(:,:,face_z), p);