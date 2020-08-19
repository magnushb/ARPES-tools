%% Reading spin data files (.ibw) from I3 beamlien at MAXlab

function [ch0,ch1,ch2,ch3,xscale,fname,pname]=readspin(nrofregions,ver,varargin)

if numel(varargin)>0
    pname=varargin{1,1};
    fname=varargin{1,2};
else
end

nrregions=nrofregions;
switch lower(ver)
    case 'old'
        channels=[0 1 2 3];
    case 'new'
        channels=[1 2 3 4];
end
        
for p=0:99
    region(p+1)={char(sprintf('_%d',p))};
end
region(1)={''};

if numel(varargin)>0
    f=fopen(sprintf('%s%s',pname,fname));
else
    [fname, pname]=uigetfile('.txt','Select spin file');
    f=fopen(sprintf('%s%s',pname,fname));
end
    

for t=1:11
    line=fgetl(f);
    if t==6
        extension=line;
    elseif t==10
        nrpoints=line;
    elseif t==11
        ax=line;
    else
    end
       
end
clear t

[T,R]=strtok(extension,'=');
[extension,R]=strtok(R,'=');clear T R;

[T,R]=strtok(ax,'=');
[ax,R]=strtok(R,'=');clear T R;

[T,R]=strtok(nrpoints,'=');
[nrpoints,R]=strtok(R,'=');clear T R;
nrpoints=str2num(nrpoints);

for h=1:nrpoints
    [T,R]=strtok(ax,' ');
    xscale(h)=str2num(T);
    ax=R;
end
clear T R ax

name=strtok(fname,'.');

switch lower(ver)
    case 'old'
        for u=1:4
            for r=1:nrregions
                spinfname=char(strcat(name,extension,'_Dev1_ctr',sprintf('%d_in',channels(u)),region(r),'.ibw'));
                ch(r,:,u)=readibw(spinfname,pname);
            end 
        end
    case 'new'
        for u=1:4
            for r=1:nrregions
                spinfname=char(strcat(name,extension,'_ch',sprintf('%d',channels(u)),region(r),'.ibw'));
                ch(r,:,u)=readibw(spinfname,pname);
            end 
        end
end

ch0=ch(:,:,1);
ch1=ch(:,:,2);
ch2=ch(:,:,3);
ch3=ch(:,:,4);

clear channels extension f h line name nrpoints nrregions p r region u ch spinfname

fclose('all');