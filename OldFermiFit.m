% Old Fermi Fit function

Extracting center part of vector
FDdata=FDdata((length(xmod)-length(xdata))/2+1:end-(length(xmod)-length(xdata))/2);

E=min(data(:,1)):data(2,1)-data(1,1):max(data(:,1));
data(:,2)=data(:,2)./sum(data(:,2));

f=FermiDirac(E,Ef,T);

x=-0.25:data(2,1)-data(1,1):0.25;
g=Gauss_funct(x,ampl,0,res);

c=conv(f,g,'same');
%fit=c./max(c);
fit=c;

error=data(1:length(fit),2)-fit';
fit_value=sum(abs(error));

plot(E,fit,'g')
hold on
plot(data(:,1),data(:,2),'b')
plot(E,error,'r');





Ef=6.2070;
E=min(data2(:,1)):0.001:max(data2(:,1));

f=FermiDirac(E,Ef,7.5);

x=-0.25:0.001:0.25;
g=Gauss_funct(x,1,0,0.0035);

c=conv(f,g,'same');


plot(E,c./8.7732,'r')
hold on
plot(data(:,1),data2(:,2))