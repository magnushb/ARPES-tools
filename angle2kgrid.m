%%% Returnes momentum and energy grid used for plotting ARPES data

function [k,en] = angle2kgrid(angle,energy)

for u=1:length(energy)
    k(u,:)=angletok(angle,energy(u));
end

for u=1:length(angle)
    en(:,u)=energy';
end
