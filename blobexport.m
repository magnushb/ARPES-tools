%%% Script for plotting data exported from BLOBSLICER

function blobexport(varargin)

if numel(varargin)>1
    sliceexp=varargin{1,2};
else
    [fname, pname] = uigetfile('*.mat','Select datafile');
    load(sprintf('%s%s',pname,fname))
end

splinei=sliceexp.splinecorrds(:,1);
splinef=sliceexp.splinecorrds(:,end);


for u=1:4
    figure;imagesc(sliceexp.xscale{1,u},sliceexp.yscale{1,u},sliceexp.I{1,u});shading flat;colormap(sprintf('%s',varargin{1,1}));set(gca,'YDir','normal')
    if u==1
        xlabel('angle x (deg)');ylabel('angle y (deg)');axis square
    elseif u==4
        xlabel('angle (deg)');ylabel('Kinetic energy (eV)');
    elseif u==2
        xlabel('angle x (deg)');ylabel('Kinetic energy (eV)');
    else
        xlabel('angle y (deg)');ylabel('Kinetic energy (eV)');
    end
            
end

