%%%%% Analysis of spin data of Bi2Se3
%% Analysis settings
clear
norm_mode=0;   % norm_mode=1 - channel normalized to 1, norm_mode=0 - channel normalized by total sum

%%% Datasets from December 2010 at MAXlab
dataset='firstK';


%%% Datasets from January 2011 at MAXlab
%dataset='firstK';
%dataset='secondK';
%dataset='M';
%dataset='between';


%Loading data
switch lower(dataset)
    case 'firstk'
% First K-point
load Spin0057;if norm_mode==1;tit='Polarization first K-point, channels normalized to 1';elseif norm_mode==0;tit='Polarization first K-point, normalized by sum';else;end  
ch0=sum(ch0,1)';
ch1=sum(ch1,1)';
ch2=sum(ch2,1)';
ch3=sum(ch3,1)';
    case 'secondk'
% Second K-point
load Spin0060;if norm_mode==1;tit='Polarization second K-point, channels normalized to 1';elseif norm_mode==0;tit='Polarization second K-point, normalized by sum';else;end
ch0=sum(ch0,1)';
ch1=sum(ch1,1)';
ch2=sum(ch2,1)';
ch3=sum(ch3,1)';
    case 'm'
        if norm_mode==1;tit='Polarization M-point, channels normalized to 1';elseif norm_mode==0;tit='Polarization M-point, normalized by sum';else;end

load Spin0062
ch0_a=sum(ch0,1)';
ch1_a=sum(ch1,1)';
ch2_a=sum(ch2,1)';
ch3_a=sum(ch3,1)';
load Spin0063
ch0_b=sum(ch0,1)';
ch1_b=sum(ch1,1)';
ch2_b=sum(ch2,1)';
ch3_b=sum(ch3,1)';
load Spin0064
ch0_c=sum(ch0,1)';
ch1_c=sum(ch1,1)';
ch2_c=sum(ch2,1)';
ch3_c=sum(ch3,1)';
ch0=ch0_a+ch0_b+ch0_c;
ch1=ch1_a+ch1_b+ch1_c;
ch2=ch2_a+ch2_b+ch2_c;
ch3=ch3_a+ch3_b+ch3_c;
    case 'between'
        if norm_mode==1;tit='Polarization between K and M, channels normalized to 1';elseif norm_mode==0;tit='Polarization between K and M, normalized by sum';else;end
        load Spin0067
        ch0_a=sum(ch0,1)';
        ch1_a=sum(ch1,1)';
        ch2_a=sum(ch2,1)';
        ch3_a=sum(ch3,1)';
        load Spin0069
        ch0_b=sum(ch0,1)';
        ch1_b=sum(ch1,1)';
        ch2_b=sum(ch2,1)';
        ch3_b=sum(ch3,1)';
        ch0=ch0_a+ch0_b;
        ch1=ch1_a+ch1_b;
        ch2=ch2_a+ch2_b;
        ch3=ch3_a+ch3_b;
    otherwise
        ch0=0;
        ch1=0;
        ch2=0;
        ch3=0;
end
        
        
        
% Spin analysis

ch4=ch3;
ch3=ch2;
ch2=ch1;
ch1=ch0;
energy=xscale;
clear ch0

%data=data1+data2+data3+data4;
%data(:,1)=data1(:,1);
%energy=data(:,1);

%%%% Spin polarized channels
%ch2=data(:,3);
%ch4=data(:,5);

%%%% Non-polarized channels
%ch1=data(:,2);
%ch3=data(:,4);

%%%% Removing constant background
ch1=ch1-min(ch1);
ch2=ch2-min(ch2);
ch3=ch3-min(ch3);
ch4=ch4-min(ch4);

% %%%% Removing integrated background
% b1=integrated_back(ch1);
% b2=integrated_back(ch2);
% b3=integrated_back(ch3);
% b4=integrated_back(ch4);
% 
% ch1=ch1-b1;
% ch2=ch2-b2;
% ch3=ch3-b3;
% ch4=ch4-b4;
% 
% %%%% Compensating for negative values
% ch1=ch1+abs(min(ch1));
% ch2=ch2+abs(min(ch2));
% ch3=ch3+abs(min(ch3));
% ch4=ch4+abs(min(ch4));


switch norm_mode
    case 0 %%%% Normalizing by total sum
        ch1=ch1./sum(ch1);
        ch2=ch2./sum(ch2);
        ch3=ch3./sum(ch3);
        ch4=ch4./sum(ch4);
    case 1 %%%% Normalizing to one
        ch1=ch1./max(ch1);
        ch2=ch2./max(ch2);
        ch3=ch3./max(ch3);
        ch4=ch4./max(ch4);
    otherwise %%%% Normalizing by total sum
        ch1=ch1./sum(ch1);
        ch2=ch2./sum(ch2);
        ch3=ch3./sum(ch3);
        ch4=ch4./sum(ch4);
end

%%%% Spin integrated, averaged
Spin_integrated=(ch1+ch2+ch3+ch4)/4;


%%%% Filtering the data with lowpass filter

% ch1_filt=lowpass(ch1);
% ch2_filt=lowpass(ch2);
% ch3_filt=lowpass(ch3);
% ch4_filt=lowpass(ch4);

% ch1_mod=[zeros(1,30) ch1' zeros(1,30)];
% ch2_mod=[zeros(1,30) ch2' zeros(1,30)];
% ch3_mod=[zeros(1,30) ch3' zeros(1,30)];
% ch4_mod=[zeros(1,30) ch4' zeros(1,30)];
Spin_integrated_mod=[zeros(1,30) Spin_integrated' zeros(1,30)];

% ch1_filt=mov_av(ch1_mod);
% ch2_filt=mov_av(ch2_mod);
% ch3_filt=mov_av(ch3_mod);
% ch4_filt=mov_av(ch4_mod);
Spin_integrated_filt=mov_av(Spin_integrated_mod);

% ch1_filt=mov_av(ch1_filt);
% ch2_filt=mov_av(ch2_filt);
% ch3_filt=mov_av(ch3_filt);
% ch4_filt=mov_av(ch4_filt);

% ch1_filt=mov_av(ch1_filt);
% ch2_filt=mov_av(ch2_filt);
% ch3_filt=mov_av(ch3_filt);
% ch4_filt=mov_av(ch4_filt);
% 
% ch1_filt=mov_av(ch1_filt);
% ch2_filt=mov_av(ch2_filt);
% ch3_filt=mov_av(ch3_filt);
% ch4_filt=mov_av(ch4_filt);

% ch1_filt=ch1_filt(31:end-30)';
% ch2_filt=ch2_filt(31:end-30)';
% ch3_filt=ch3_filt(31:end-30)';
% ch4_filt=ch4_filt(31:end-30)';
Spin_integrated_filt=Spin_integrated_filt(31:end-30);


%%%% Removing constant background again
% ch1_filt=ch1_filt-min(ch1_filt);
% ch2_filt=ch2_filt-min(ch2_filt);
% ch3_filt=ch3_filt-min(ch3_filt);
% ch4_filt=ch4_filt-min(ch4_filt);


%%%% Polarization
Asymm_pol=(ch2-ch4)./(ch2+ch4);
% Asymm_pol=(ch2_filt-ch4_filt)./(ch2_filt+ch4_filt);
S_eff=0.17;
Pol=1/S_eff.*Asymm_pol;

Pol_mod=[zeros(1,30) Pol' zeros(1,30)];
Pol_filt=mov_av(Pol_mod);
Pol_filt=Pol_filt(31:end-30)';


%ch1(6)=1e-9; ch3(6)=1e-9; %% To avoid NaN since ch1 and ch3 happen to have 0 at same index
Asymm_nonpol=(ch1-ch3)./(ch1+ch3);
% Asymm_nonpol=(ch1_filt-ch3_filt)./(ch1_filt+ch3_filt);
Zero_check=1/S_eff.*Asymm_nonpol;

Zero_mod=[zeros(1,30) Zero_check' zeros(1,30)];
Zero_filt=mov_av(Zero_mod);
Zero_filt=Zero_filt(31:end-30)';



%%%% Spin up/down intensity
I_up=Spin_integrated.*(1+Zero_check);%Pol);
I_down=Spin_integrated.*(1-Zero_check);%Pol);
Spin_sum=I_up+I_down;

Fermi_energy=0;%5.86;   %%%% Determined from Angle resolved plot
Calibration_term=0.0; %%% Calibrate energy scale with scale from angle resolved where Ef is determined

%%%% Figure 1a Non-normalized channels
%%%Binning for plot
n=1;
for u=2:2:length(ch2)-1
    ch2_bin(n)=ch2(u)+ch2(u+1);
    ch4_bin(n)=ch4(u)+ch4(u+1);
    energy_bin(n)=(energy(u)+energy(u+1))./2;
    n=n+1;
end

%%%Plot
% figure
% H=plot(energy_bin-Fermi_energy+Calibration_term,ch2_bin,'^');
% set(H,'MarkerSize',6)
% set(H,'MarkerEdgeColor','r')
% set(H,'MarkerFaceColor','r')
% xlabel('Binding Energy (eV)','fontsize',13)
% ylabel('Intensity (a.u.)','fontsize',13)
% hold on
% H2=plot(energy_bin-Fermi_energy+Calibration_term,ch4_bin,'v');
% set(H2,'MarkerSize',6)
% set(H2,'MarkerEdgeColor','b')
% set(H2,'MarkerFaceColor','b')
% legend('Left detector','Right detector')
% axis([-0.65 0.15 -0.1e4 2.5e4])
% % axis([-0.65 0.15 -0.001 0.08])
% % axis([min(energy-Fermi_energy) max(energy-Fermi_energy) 0 0.04])




%%%% Figure 1b Normalized channels
% %%%Binning for plot
% n=1;
% for u=2:2:length(Spin_integrated)-1
%     Spi_int(n)=Spin_integrated(u)+Spin_integrated(u+1);
%     energy_bin(n)=(energy(u)+energy(u+1))./2;
%     n=n+1;
% end
% %%%Plot
% % H=plot(energy-Fermi_energy+Calibration_term,Spin_integrated,'d');
% H=plot(energy_bin-Fermi_energy+Calibration_term,Spi_int,'d');
% set(H,'MarkerSize',6)
% set(H,'MarkerEdgeColor','k')
% set(H,'MarkerFaceColor','k')
% xlabel('Binding Energy (eV)','fontsize',13)
% ylabel('Intensity (a.u.)','fontsize',13)
% % hold on
% % plot(energy,Spin_integrated_filt,'g')
% % axis([-0.65 0.15 -0.0005 0.04])
% %axis([-0.65 0.15 -0.001 0.08])
% % axis([min(energy-Fermi_energy) max(energy-Fermi_energy) 0 0.04])
% 


% %%%% Figure 2   Polarization
figure
H2=plot(energy-Fermi_energy+Calibration_term,Zero_check,'^');
hold on
plot(energy-Fermi_energy+Calibration_term,Zero_filt)
%set(H2,'MarkerSize',6)
set(H2,'MarkerEdgeColor','b')
% set(H2,'MarkerFaceColor','b')
H=plot(energy-Fermi_energy+Calibration_term,Pol,'v');
plot(energy-Fermi_energy+Calibration_term,Pol_filt,'.-r');
%set(H,'MarkerSize',6)
set(H,'MarkerEdgeColor','r')
set(H,'MarkerFaceColor','r')
%axis([-0.65 0.15 -2 2])
legend('Out-of-plane polarization','Moving average','In-plane polarization','Moving average')
xlabel('E_k (eV)','fontsize',13)
ylabel('Polarization','fontsize',13)
title(tit)
%title('Polarization first K-point, channels normalized to 1')
%title('Polarization between K and M, channels normalized to 1')
%title('Polarization second K-point, channels normalized to 1')
%axis([4.9 5.9 -1 1])

%%

% %%%% Figure 3   Spin up/down EDCs
figure
%%Binning for plot
n=1;
for u=2:2:length(I_up)-1
    I_up_bin(n)=I_up(u)+I_up(u+1);
    I_down_bin(n)=I_down(u)+I_down(u+1);
    Spin_sum_bin(n)=Spin_sum(u)+Spin_sum(u+1);
    energy_bin(n)=(energy(u)+energy(u+1))./2;
    n=n+1;
end
%%%Plot
% H=plot(energy-Fermi_energy+Calibration_term,I_up,'^');
H=plot(energy_bin-Fermi_energy+Calibration_term,I_up_bin,'^');
set(H,'MarkerSize',6)
set(H,'MarkerEdgeColor','r')
set(H,'MarkerFaceColor','r')
hold on
% H2=plot(energy-Fermi_energy+Calibration_term,I_down,'v');
H2=plot(energy_bin-Fermi_energy+Calibration_term,I_down_bin,'v');
set(H2,'MarkerSize',6)
set(H2,'MarkerEdgeColor','b')
set(H2,'MarkerFaceColor','b')
% H3=plot(energy-Fermi_energy+Calibration_term,Spin_sum,'d');
H3=plot(energy_bin-Fermi_energy+Calibration_term,Spin_sum_bin,'d');
set(H3,'MarkerSize',6)
set(H3,'MarkerEdgeColor','k')
set(H3,'MarkerFaceColor','k')
legend('Spin up','Spin down','Up+Down')
xlabel('Binding Energy (eV)','fontsize',13)
ylabel('Intensity (a.u.)','fontsize',13)
%axis([-0.65 0.15 -0.005 0.08])
%axis([-0.65 0.15 -0.01 0.16])
% plot(energy-Fermi_energy,Spin_integrated.*2,'g:')



