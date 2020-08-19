%%%%% Data binning algoritm for THEMIS data. Binning in energy and x- and y angles. 
%%%%% Inputs: original converted data (data) on "events-form", minimum energy for binned matrix (E_min), 
%%%%% maximum energy (E_max), energy step size (E_step_size), number of
%%%%% binnes in x- and y angles (N_x and N_y respectively), mode is the lensmode (string)
%%%%% Date: 2009.12.01
%%%%% Magnus H. Berntsen

function [Bin_matrix,E,x_angle,y_angle]=THEMIS_data_binning(data,E_min,E_max,E_step_size,N_x,N_y,mode)

%%%% Extracting relevant energy interval and stores this as new data
low=find(data(:,3)<=E_min,1,'last');
high=find(data(:,3)>=E_max,1,'first');
data2=data(low:high,:);

switch lower(mode)
    case 'lad'
        y_angle_max=7;
    case 'mad'
        y_angle_max=4;
    case 'wam'
        y_angle_max=13;
    otherwise
        disp('Unknown lens mode.');
end



%%%% Defines binning vectors etc.
E=(E_min:E_step_size:E_max)';                   %%% Energy binning vector
x_angle=linspace(-y_angle_max,y_angle_max,N_x); %%% x-angle binning vector
y_angle=linspace(-y_angle_max,y_angle_max,N_y); %%% y-angle binning vector
Bin_matrix=zeros(N_x,N_y,length(E));            %%% Allocates space for binning matrix
angle_step_size=x_angle(2)-x_angle(1);          %%% Sep size in angle (assumed to be the same in x and y)


%%%% Goes through the data (all events), checks for conditions and places it in the right bin
for n=1:1:length(data2(:,3))
    for k=1:1:length(E)                 %%% Energy bin
        if data2(n,3)<=E(k)+E_step_size/2 && data2(n,3)>E(k)-E_step_size/2
            E_ind=k;
        else
        end
    end
    
    for l=1:1:length(x_angle)           %%% x-angle bin
        if data2(n,1)<=x_angle(l)+angle_step_size/2 && data2(n,1)>x_angle(l)-angle_step_size/2
            x_ind=l;
        else
        end
    end
    
    for m=1:1:length(y_angle)           %%% y-angle bin
        if data2(n,2)<=y_angle(m)+angle_step_size/2 && data2(n,2)>y_angle(m)-angle_step_size/2
            y_ind=m;
        else
        end
    end
    
    Bin_matrix(x_ind,y_ind,E_ind)=Bin_matrix(x_ind,y_ind,E_ind)+1;
    
end











% %%% Sort rows in data file on angles and energy interval
% for u=1:1:length(data)
%     t_index=find(t<=data(u,3),1,'last');
%     matrix(data(u,1)+1,data(u,2)+1,t_index)=matrix(data(u,1)+1,data(u,2)+1,t_index)+1;
% end
% 
% 
% % %%%% Sum all t for every pixel
% % % for u=1:1:length(data)
% % %     t_index=find(t<=data(u,3),1,'last');
% % %     matrix(data(u,1)+1,data(u,2)+1,1)=matrix(data(u,1)+1,data(u,2)+1,1)+1;
% % % end
% % 
%%% Scanning plot through matrix in xy plane, i.e. scans through time
% for y=1:1:121
%     f=Bin_matrix(:,:,y);
%     imagesc(f)
%     pause(0.1)
% end
% % % 
% % 
% % %%%% Sums over all pixels, keeps time, i.e. produces counts vs. time plot
% % s=sum(sum(matrix));
% % 
% % for p=1:1:Nsteps+1
% %     time_sum(p)=s(1,1,p);
% % end
% % 
% % plot(t,time_sum)