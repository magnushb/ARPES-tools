% Wraping data from THEMIS_load_data in shape compatible with input to BLOBSLICER
%
% Input arguments:
%                   mat = 3D data matrix from "THEMIS_load_data.m"
%                   xscale = scale of x-dim in mat
%                   yscale = scale of y-dim in mat
%                   escale = energy scale of mat
%                   fname = save data using this file name with extension
%                           *.mat
%                   varargin = optional binning of data ,{xbin ybin ebin}
%                              using function "binvector.m" and
%                              "bindata3.m"
%
% Output arguments:
%                   No output to workspace. Function only saves a file
%                   'fname.mat' containing the 3D data matrix and scales
%                   for axes in a structure compatible with "blobslicer.m"


function toblobslicer(mat,xscale,yscale,escale,fname,varargin)

if length(varargin)>0
    xbin=varargin{1,1};
    ybin=varargin{1,2};
    zbin=varargin{1,3};
else
    xbin=0;
    ybin=0;
    zbin=0;
end

if xbin>1 | ybin>1 | zbin>1
    data.x=shiftdim(bindata3(mat,xbin,ybin,zbin),2);
else
    data.x=shiftdim(mat,2);
end

if zbin>1
    data.escale=binvector(escale,zbin);
else
    data.escale=escale;
end

if xbin>1
    data.xscale=binvector(xscale,xbin);
else
    data.xscale=xscale;
end

if ybin>1
    data.yscale=binvector(yscale,ybin);
else
    data.yscale=yscale;
end

data.t=[];

save(sprintf('%s',fname),'data');
