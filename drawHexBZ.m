%%% Script for drawing a hexagonal Brillouin zone map, based on given
%%% lattice parameter (a)
%%% rotation of coordinate system by angle alpha, can be given as input in
%%% varargin parameter

function drawHexBZ(a,varargin)

arg_in_flag = numel(varargin);

% Defining trimer translation vectors

K1=[1/sqrt(3);1].*(2*pi/a);
K2=[2/sqrt(3);0].*(2*pi/a);
K3=[1/sqrt(3);-1].*(2*pi/a);
K4=[-1/sqrt(3);-1].*(2*pi/a);
K5=[-2/sqrt(3);0].*(2*pi/a);
K6=[-1/sqrt(3);1].*(2*pi/a);

P1=[2*pi/sqrt(3)/a;2*pi/3/a];
P2=[2*pi/sqrt(3)/a;-2*pi/3/a];
P3=[0;-4*pi/3/a];
P4=[-2*pi/sqrt(3)/a;-2*pi/3/a];
P5=[-2*pi/sqrt(3)/a;2*pi/3/a];
P6=[0;4*pi/3/a];

if arg_in_flag % if rotation angle as input, then rotate accordingly...
    % create rotation matrix
    alpha = varargin{1}*pi/180; 
    R=[cos(alpha) , -sin(alpha);...
        sin(alpha) , cos(alpha)];
    
    % rotate vector and points
    K1=R*K1;
    K2=R*K2;
    K3=R*K3;
    K4=R*K4;
    K5=R*K5;
    K6=R*K6;
    
    P1=R*P1;
    P2=R*P2;
    P3=R*P3;
    P4=R*P4;
    P5=R*P5;
    P6=R*P6;
end

P7=P2+K1;
P8=P1+K2;
P9=P2+K2;
P10=P3+K2;
P11=P2+K3;
P12=P3+K3;
P13=P2+K4;
P14=P3+K4;
P15=P4+K4;
P16=P3+K5;
P17=P4+K5;
P18=P5+K5;
P19=P6+K5;
P20=P5+K6;
P21=P6+K6;
P22=P1+K6;
P23=P6+K1;
P24=P1+K1;


%figure;hold on
L1=line([P6(1) P1(1)],[P6(2) P1(2)]);
L2=line([P1(1) P2(1)],[P1(2) P2(2)]);
L3=line([P2(1) P3(1)],[P2(2) P3(2)]);
L4=line([P3(1) P4(1)],[P3(2) P4(2)]);
L5=line([P4(1) P5(1)],[P4(2) P5(2)]);
L6=line([P5(1) P6(1)],[P5(2) P6(2)]);

L7=line([P1(1) P7(1)],[P1(2) P7(2)]);
L8=line([P7(1) P24(1)],[P7(2) P24(2)]);
L9=line([P24(1) P23(1)],[P24(2) P23(2)]);
L10=line([P23(1) P22(1)],[P23(2) P22(2)]);
L11=line([P22(1) P6(1)],[P22(2) P6(2)]);

L12=line([P21(1) P22(1)],[P21(2) P22(2)]);
L13=line([P19(1) P20(1)],[P19(2) P20(2)]);
L13=line([P21(1) P20(1)],[P21(2) P20(2)]);
L14=line([P19(1) P5(1)],[P19(2) P5(2)]);

L15=line([P19(1) P18(1)],[P19(2) P18(2)]);
L16=line([P18(1) P17(1)],[P18(2) P17(2)]);
L17=line([P17(1) P16(1)],[P17(2) P16(2)]);
L18=line([P16(1) P4(1)],[P16(2) P4(2)]);

L19=line([P16(1) P15(1)],[P16(2) P15(2)]);
L20=line([P15(1) P14(1)],[P15(2) P14(2)]);
L21=line([P14(1) P13(1)],[P14(2) P13(2)]);
L22=line([P13(1) P3(1)],[P13(2) P3(2)]);

L23=line([P13(1) P12(1)],[P13(2) P12(2)]);
L24=line([P12(1) P11(1)],[P12(2) P11(2)]);
L25=line([P11(1) P10(1)],[P11(2) P10(2)]);
L26=line([P10(1) P2(1)],[P10(2) P2(2)]);

L27=line([P10(1) P9(1)],[P10(2) P9(2)]);
L28=line([P9(1) P8(1)],[P9(2) P8(2)]);
L29=line([P8(1) P7(1)],[P8(2) P7(2)]);












