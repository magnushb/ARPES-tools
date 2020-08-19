% Rebinning of BLOBSLICER data (.mat file) to new BLOBSLICER file
%
% Input arguments:
%                   data = BLOBSLICER file with data (.mat file)
%                   fname = save data using this file name with extension
%                           *.mat (i.e. do not write ".mat" in filename)
%                   varargin = optional rebinning of data ,{xbin ybin ebin}
%                              using function "binvector.m" and
%                              "bindata3.m"
%
% Output arguments:
%                   No output to workspace. Function only saves a file
%                   'fname.mat' containing the 3D data matrix and scales
%                   for axes in a structure compatible with "blobslicer.m"


function fromblob2blob(data,fname,varargin)

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
    data.x=bindata3(data.x,zbin,xbin,ybin);
else
    data.x=data.x;
end

if zbin>1
    data.escale=binvector(data.escale,zbin);
else
    data.escale=data.escale;
end

if xbin>1
    data.xscale=binvector(data.xscale,xbin);
else
    data.xscale=data.xscale;
end

if ybin>1
    data.yscale=binvector(data.yscale,ybin);
else
    data.yscale=data.yscale;
end

data.t=[];

save(sprintf('%s',fname),'data');