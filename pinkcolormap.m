% Colormap "icepink"

r0 = linspace(20,44,50)';
r1 = linspace(44,72,50)';
r2 = linspace(72,255,75)';
r3 = linspace(255,244,150)';

g0 = linspace(20,0,50)';
g1 = linspace(0,61,50)';
g2 = linspace(61,255,75)';
g3 = linspace(255,42,150)';

b0 = linspace(30,77,50)';
b1 = linspace(77,255,75)';
b2 = linspace(255,255,50)';
b3 = linspace(255,185,150)';

pinksteel = [ [r0; r1 ; r2 ; r3;] [g0; g1 ; g2 ; g3;
] [b0; b1 ; b2 ; b3;] ]./255;
%colormap(pinksteel)
colormap(pinkcolormap)