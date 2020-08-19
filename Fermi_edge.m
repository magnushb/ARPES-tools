%data=load('Converted_AuFermi_LAD_Ek63_Ep2_Et180.txt');
load data

%%% Binning data
[Bin_matrix,energy,xangle,yangle]=THEMIS_data_binning(data,6.3,6.42,0.001,256,256);

%%% Summing in x and y angle
s_x=sum(Bin_matrix,1);
s_y=sum(Bin_matrix,2);
summed_x(:,:)=s_x(1,:,:);
summed_y(:,:)=s_y(:,1,:);

%%% Plotting the summed energy-angle slices
pcolor(energy,xangle,summed_x)
shading interp
title('Summed x');
xlabel('Energy [eV]')
ylabel('Angle [deg]')

figure

pcolor(energy,xangle,summed_y)
shading interp
title('Summed y');
xlabel('Energy [eV]')
ylabel('Angle [deg]')


% % hist(data(:,3),1500);
% 
% find(data(:,3)>6.3);
% ind_min=ans(1);
% find(data(:,3)<6.42);
% ind_max=ans(end);
% edge=data(ind_min:ind_max,3);
% hist(edge,500);
% data2=data(ind_min:ind_max,:);
