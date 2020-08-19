%%% Function for getting constant energy slice from a k-k-E matrix

function mat = getEslice(dmat,index,sum_slices)

mat=shiftdim(sum(dmat(index-(sum_slices-1)/2:index+(sum_slices-1)/2,:,:),1),1)';
