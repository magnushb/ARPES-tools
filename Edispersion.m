% sigma=1 - front side, sigma=-1 - interface side

function Ek = Edispersion(k,E0,D,B,vF,V,delta,sigma)



%astrom=1e-10;
el=1.6e-19;
hbar=1.0546e-34/el;
%k=k.*1e10;

E0=E0;%*el;
D=D;%*el*astrom^2;
delta=delta;%*el;
B=B;%*el*astrom^2;
vF=vF*1e5*1e10;
V=V;%*el;




Ekup = E0-D.*(k.^2)+sqrt((V+sigma*vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);
Ekdwn = E0-D.*(k.^2)-sqrt((V+sigma*vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);

Ek=[Ekup;Ekdwn];%.*1.6e19;
