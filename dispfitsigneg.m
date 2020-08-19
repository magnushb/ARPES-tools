function Ek = dispfitsigneg(param,k)

% param består av: [E0 D B vF V delta]
sigma=-1;
%astrom=1e-10;
el=1.6e-19;
hbar=1.0546e-34/el;
%k=k./astrom;

E0=param(1);%*el;
D=param(2);%*el*astrom^2;
delta=param(6);%*el;
B=param(3);%*el*astrom^2;
vF=param(4)*1e5*1e10;
V=param(5);%*el;




Ekup = E0-D.*(k.^2)+sqrt((V+sigma*vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);
%Ekdwn = E0-D.*(k.^2)-sqrt((V+sigma*vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);

%Ek=[Ekup;Ekdwn];
Ek=Ekup;%.*1.6e19;
%Ek=Ekdwn.*1.6e19;