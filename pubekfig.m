% Script for generating standart figures of energy-momentum spectra
% 
% Input arguments:
%                   mat = data matrix (dimenson N x M)
%                   angle = angle vector (dimension 1 x N or N x 1)
%                   energy = energy vector (dimension 1 x M or M x 1)
%                   varargs = {'kspace' = 'simple' or 'advanced', 'energy' = 'kinetic' or 'binding, 
%                             'title' = '....' (user input), 'cmap' = 'hot' or 'copper' or ...,
%                             'save' = 'figurename.png' or '*.eps' or ...}
%
% Output arguments: 
%                   None, produces a figure and optionally saves the fiugre
%                   as a file
% 
% Can be used as: 
%                   pubekfig(mat,angle,energy,'kspace','advanced','title',f
%                   name,'cmap','jet','save','figurename.png')

function te=pubekfig(mat,angle,energy,varargin)

if numel(varargin)>1
else
    figure;pcolor(angle,energy,mat);shading interp;colormap(hot(256))
    xlabel('Momentum (\Å^{-1}')
    ylabel('Kinetic energy (eV)')
end


