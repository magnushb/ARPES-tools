% Script for fixing the annoying problem where the ticks in the figures 
% have different number of digits, i.e. [0 0.5 1 1.5 2 ...] etc. instead of
% [0.1 0.5 1.0 1.5 2.0 ...] (the latter is more correct!)
%
% Usage:    First plot your figure with the ticks you want to have, 
%           then call this function
%
% Input:    ax = defines which axis you want to adjust (X or Y). Put in
%                your choice as a string, eiter 'x' or 'y'.
%
%           d = desired number of digits after the comma
%
% Example:  fixAxisDigits('y',2)


function fixAxisDigits(ax,d)

if lower(ax) == 'x'
    set(gca, 'XTick', get(gca, 'XTick'), 'XTickLabel', sprintf(strcat('%0.',num2str(d),'f|'),get(gca, 'XTick')));
elseif lower(ax) == 'y'
    set(gca, 'YTick', get(gca, 'YTick'), 'YTickLabel', sprintf(strcat('%0.',num2str(d),'f|'),get(gca, 'YTick')));
else
end