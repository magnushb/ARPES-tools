%%% Function for getting Ek slice from blobslice matrix


function mat = getEKslice(dmat,slice_dimension,index,sum_slices)

switch lower(slice_dimension)
    case 'y'
        mat=shiftdim(sum(dmat(:,index-(sum_slices-1)/2:index+(sum_slices-1)/2,:),2),2)';
    case 'x'
        mat=sum(dmat(:,:,index-(sum_slices-1)/2:index+(sum_slices-1)/2),3);
    otherwise
        mat=[];
end