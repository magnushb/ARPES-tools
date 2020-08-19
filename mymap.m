% Custom colormap, rangeing form white to blue to black

function c = mymap(colors)

switch lower(colors)
    case 'darkblue'
        color1=[255 255 255];
        color2=[73 28 255];
        color3=[7 0 33];
    case 'brightblue'
        color1=[255 255 255];
        color2=[48 138 255];
        color3=[1 14 31];
        %color3=[0 0 0];
    case 'ryg'
        color1=[173 24 24];
        color2=[255 251 173];
        color3=[15 138 66];
    case 'ryb'
        color1=[173 24 24];
        color2=[255 253 209];
        color3=[30 60 212];
    case 'brun'
        color1=[242 234 191];
        color2=[138 130 87];
        color3=[64 55 7];
    otherwise
        color1=[255 255 255];
        color2=[73 28 255];
        color3=[7 0 33];
end

c1a=linspace(color3(1),color2(1),128)';
c1b=linspace(color2(1),color1(1),128)';
c2a=linspace(color3(2),color2(2),128)';
c2b=linspace(color2(2),color1(2),128)';
c3a=linspace(color3(3),color2(3),128)';
c3b=linspace(color2(3),color1(3),128)';

c=[c1a,c2a,c3a;c1b,c2b,c3b]./255;

