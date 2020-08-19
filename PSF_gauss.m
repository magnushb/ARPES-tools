%%% 2D Gauss distribution S(x,y) for Point Spread Function. The function is
%%% normalized to one and thus can be viewed as a function which takes the
%%% intensity in the center pixel and spreads this out on all pixels in the
%%% defined range according to the Gaussian distribution. The normalization
%%% is important so that no intensity is either "created" or "destroyed" in
%%% the blurring process.
%%%
%%% The half maximum of the Gaussian can be expressed in terms of the sigma as 
%%% x = +/-sigma*sqrt(2*ln(2)), i.e. FWHM = 2*|x| ~ 2.355*sigma. 
%%% 
%%% Input:     sigma    =  the sigma for the Gauss function
%%%            pixel    =  the maximum coordinate-value in both x and y
%%%                        direction, i.e. x=-pixel:1:pixel;, and y=-pixel:1:pixel;
%%%
%%% Output:    S        =  the 2D Gaussian spread function
%%%            I        =  the integral of the function over the defined
%%%                        interval. This is a normalization check and
%%%                        should result in something close to 1.
%%%
%%% Can be used as:     [S,I]=PSF_gauss(sigma,pixel);


function [S,I]=PSF_gauss(sigma,pixel)

% Calculate prefactor -  assume integral normalized to one
A=1/(2*pi*sigma^2);
% Define the coordinate limits
[x,y]=meshgrid(-pixel:1:pixel,-pixel:pixel);
% Calculate the 2D Gaussian function given the sigma and the x and y ranges
S=A*exp(-(x.^2+y.^2)/(2*sigma^2));
% Control of normalization, should integrate to I=1.
I=dblquad(@(x,y)A*exp(-(x.^2+y.^2)/(2*sigma^2)),-pixel,pixel,-pixel,pixel);


