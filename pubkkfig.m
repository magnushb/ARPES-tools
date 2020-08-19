% Fast publish of momentum-momentum fig
%
% Example:   
%           pubkkfig(mat,ax,ay,Ef,angle_zero,rot_offset,plot_limits,fname_output)

function pubkkfig(mat,anglx,angly,Ek,varargin)

if numel(varargin)==1
    azero=varargin{1,1};
    opt='plot';
elseif numel(varargin)==2
    azero=varargin{1,1};
    rot=varargin{1,2};
    opt='plot';
elseif numel(varargin)==3
    azero=varargin{1,1};
    rot=varargin{1,2};
    lim=varargin{1,3};
    opt='plotlim';
elseif numel(varargin)==4 && numel(varargin{1,3})>0
    azero=varargin{1,1};
    rot=varargin{1,2};
    lim=varargin{1,3};
    fname=varargin{1,4};
    opt='print';
elseif numel(varargin)==4 && numel(varargin{1,3})==0
    azero=varargin{1,1};
    rot=varargin{1,2};
    fname=varargin{1,4};
    opt='print_wl';
else
    opt='plot';
    azero=[0 0];
    rot=0;
end

[ax,ay]=meshgrid(anglx-azero(1),angly-azero(2));
[th,rho]=cart2pol(ax,ay);
thr=th+rot*pi/180;
k=angletok(rho,Ek);
[kx,ky]=pol2cart(thr,k);

switch opt
    case 'plot';
        figure;pcolor(kx,ky,mat);shading flat;colormap(gray(256))
        xlabel('k_x (Å^{-1})');ylabel('k_y (Å^{-1})');
    case 'plotlim'
        figure;pcolor(kx,ky,mat);shading flat;colormap(gray(256))
        xlabel('k_x (Å^{-1})');ylabel('k_y (Å^{-1})');axis(lim)
    case 'print'
        h=figure;pcolor(kx,ky,mat);shading flat;colormap(gray(256))
        xlabel('k_x (Å^{-1})');ylabel('k_y (Å^{-1})');axis(lim)
        print(h,fname,'-dpng');
    case 'print_wl'
        h=figure;pcolor(kx,ky,mat);shading flat;colormap(gray(256));caxis([6e-5 14e-5])
        xlabel('k_x (Å^{-1})');ylabel('k_y (Å^{-1})');
        print(h,fname,'-dpng');
    otherwise
        err='Something is wrong...'
end

        
