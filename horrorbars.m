% Plotting vertical and horizontal error bars (a.k.a. horrorbars ;)
%
% Input:        x               = x values
%               y               = y values
%               ex              = uncertainty in x
%               ey              = uncertainty in y
%               color_x(y)      = line color
%               line_width_x(y) = line width
%
% Error bars will be plotted as basic lines accordig to [x-ex x+ex] and [y-ey y+ey]
%
% Requires that the figure has a 'hold on' active.

function horrorbars(x,y,ex,ey,color_x,line_width_x,color_y,line_width_y)

    % vertical error bars
    for g=1:length(x)
        L=line([x(g) x(g)],[y(g)-ey(g) y(g)+ey(g)]);
        set(L,'linewidth',line_width_y,'color',color_y);
    end
    % horizontal errorbars
    for g=1:length(x)
        L=line([x(g)-ex(g) x(g)+ex(g)],[y(g) y(g)]);
        set(L,'linewidth',line_width_x,'color',color_x);
    end
    