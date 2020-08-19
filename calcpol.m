%%% Calculates polarization based on input of 4 channels from spin detector

function [Pol_inp,Pol_oop,Spin_integrated,ch1,ch2,ch3,ch4]=calcpol(ch1,ch2,ch3,ch4,back_mode,norm_mode)

ch1=sum(ch1,1)';
ch2=sum(ch2,1)';
ch3=sum(ch3,1)';
ch4=sum(ch4,1)';

%%% Removing background
switch lower(back_mode)
    case 'min' % Removing minimum value of background
        ch1=ch1-min(ch1);
        ch2=ch2-min(ch2);
        ch3=ch3-min(ch3);
        ch4=ch4-min(ch4);
    case 'mean' % Removing mean value of three uppermost points
        ch1=ch1-mean(ch1(end-3:end));
        ch2=ch2-mean(ch2(end-3:end));
        ch3=ch3-mean(ch3(end-3:end));
        ch4=ch4-mean(ch4(end-3:end));
    case 'mean2'
        ch1=ch1-mean(ch1(end-8:end));
        ch2=ch2-mean(ch2(end-8:end));
        ch3=ch3-mean(ch3(end-8:end));
        ch4=ch4-mean(ch4(end-8:end));
    otherwise   % no background removal
end


%%% Normalizing
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
    case 2 %%%% Normalizing by channel intensity factor
        normcoeff=[3.3273    2.5145    3.8687    2.2389];%[1.6805    1.2676    1.9873    1.1449]; % extracted from 'findnormcoeff.m'
        ch1=ch1./normcoeff(1);
        ch2=ch2./normcoeff(2);
        ch3=ch3./normcoeff(3);
        ch4=ch4./normcoeff(4);
    case 3
        ch1=ch1./mean(ch1(end-3:end));
        ch2=ch2./mean(ch2(end-3:end));
        ch3=ch3./mean(ch3(end-3:end));
        ch4=ch4./mean(ch4(end-3:end));
    case 4
        ch1=ch1./mean(ch1(end-10:end));
        ch2=ch2./mean(ch2(end-10:end));
        ch3=ch3./mean(ch3(end-10:end));
        ch4=ch4./mean(ch4(end-10:end));
    case 5
        
    otherwise %%%% If not stated, normalize to total sum
        ch1=ch1./sum(ch1);
        ch2=ch2./sum(ch2);
        ch3=ch3./sum(ch3);
        ch4=ch4./sum(ch4);
end



%%%% Spin integrated, averaged
Spin_integrated=(ch1+ch2+ch3+ch4);

%%%% Polarization
S_eff=0.17;

Asymm_oop=(ch2-ch4)./(ch2+ch4);
%Asymm_oop=(ch2-ch4)./Spin_integrated;
Pol_oop=1/S_eff.*Asymm_oop;


Asymm_inp=(ch3-ch1)./(ch1+ch3); % sign reversal due to rotation of mott!!!
%Asymm_inp=(ch3-ch1)./Spin_integrated;
Pol_inp=1/S_eff.*Asymm_inp;



%%%% Spin up/down intensity
% I_up=Spin_integrated.*(1+Zero_check);%Pol);
% I_down=Spin_integrated.*(1-Zero_check);%Pol);






