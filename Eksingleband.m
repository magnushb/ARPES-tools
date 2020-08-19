% calculates band dispersion, input k is in Å^-1 and energy returned in eV

function [Ek,varargout] = Eksingleband(param,k,delta,mode)

el=1.6e-19;         % in J
hbar=1.0546e-34/el; % in eV/s


E0=param(1); % in eV
D=param(2);  % in eVÅ^2
delta=delta; % in eV
B=param(3);  % in eVÅ^2
vF=param(4)*1e5*1e10; % fermi velocity in Å/s


switch lower(mode)
    case 'fit'
        Ekpos=E0-D.*(k.^2)+sqrt((vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);
        Ek=Ekpos;               % in eV
    case 'plot'
        Ekpos=E0-D.*(k.^2)+sqrt((vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);
        Ekneg=E0-D.*(k.^2)-sqrt((vF*hbar.*k).^2+((delta/2)-B.*(k.^2)).^2);
        Ek=[Ekpos Ekneg];       % in eV
        varargout{1}=[k,k];     % in Å^-1
end
