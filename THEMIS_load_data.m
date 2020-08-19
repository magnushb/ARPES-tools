%%% Script for loading data aquired with THEMIS analyzer.
%%% Source file is *.h5 file with converted 3D data matrix.


% Select data file (*.h5 file)
[fname, pname] = uigetfile('*.h5','Select datafile');
cd(pname)

% Get file info and structure
fileinfo=hdf5info(fname);
file_date=strtok(fname,'_');

% Determine how many datasets there are in the file and get their names
number_of_groups=size(fileinfo.GroupHierarchy.Groups);

for r=1:number_of_groups(2)
    groups(1,r)={strtok(fileinfo.GroupHierarchy.Groups(1,r).Name,'/')};
end

% Displays the different datasets and waits for you to choose
choice = menu(sprintf('Choose a dataset \n(for more info regarding datasets, see measurement LOG from file %s)',char(fname)),groups);
answer=groups(choice);

% This is a less complicated dataset selector, eneter dataset name manually
%prompt = {'Choose dataset:'};
%answer = inputdlg(prompt,'Dataset selector');

% Find name of datasets
if number_of_groups(2) > 1
    [throw,keep]=strtok(fileinfo.GroupHierarchy.Groups(1,1).Datasets.Name,'/');
    setname=strtok(keep,'/');
else
    [throw,keep]=strtok(fileinfo.GroupHierarchy.Groups.Datasets.Name,'/');
    setname=strtok(keep,'/');
end

% Read data from selected dataset
data=hdf5read(fname,sprintf('/%s/%s',char(answer),char(setname)));
% Convert from int32 to double, because MATLAB plot functions can't handle integers
data=double(shiftdim(data,1));

% Get attributes for selected dataset
min_energy=hdf5read(fname,sprintf('/%s/%s',char(answer),char(setname)),'minimumenergy');        % Minimum energy
max_energy=hdf5read(fname,sprintf('/%s/%s',char(answer),char(setname)),'maximumenergy');        % Maximum energy
max_angle=hdf5read(fname,sprintf('/%s/%s',char(answer),char(setname)),'maximumangle');          % Absolute value of max angle in rad
%dim_offsets=hdf5read(fname,sprintf('/%s/%s',char(answer),char(setname)),'DIMENSION_OFFSETS');  % Max angles and min energy*(-1)
%dim_factors=hdf5read(fname,sprintf('/%s/%s',char(answer),char(setname)),'DIMENSION_FACTORS');   % Step sizes in angles and energy
%lensmode=hdf5read(fname,sprintf('/%s',char(answer)),'lensmode');                                % Name of lens mode
%kinetic_energy=hdf5read(fname,sprintf('/%s',char(answer)),'Kinetic Energy');                    % Kinetic energy setting used in measurement
%pass_energy=hdf5read(fname,sprintf('/%s',char(answer)),'Pass Energy');                          % Pass energy used in measurement

% Create angle and energy vectors (grid points for data matrix)
data_mat_dim=size(data);
vector_x_angle=linspace(-(max_angle/pi*180),(max_angle/pi*180),data_mat_dim(1));
vector_y_angle=linspace(-(max_angle/pi*180),(max_angle/pi*180),data_mat_dim(2));
vector_energy=linspace(min_energy,max_energy,data_mat_dim(3));

%[mesh_x_angle,mesh_y_angle,mesh_energy]=meshgrid(vector_x_angle,vector_y_angle,vector_energy);

data_axis_explanation={'angle','angle','energy'};

% % Create energy histogram
% energy_hist=shiftdim(sum(sum(data,1),2),1);
% figure
% plot(vector_energy,energy_hist)
% xlabel('Kinetic energy (eV)')
% ylabel('Counts')
% title(sprintf('X and Y summed for data in set %s',char(groups(choice))))
% 
% % Find Fermi edge
% energy_hist_ma=smooth(diff(energy_hist),10,'moving');
% E_coord=find(energy_hist_ma==min(energy_hist_ma));
% 
% 
% % Create slice plot of data
% x_slice=0;
% y_slice=0;
% E_slice=vector_energy(E_coord);
% %E_slice=min_energy+(max_energy-min_energy)/2;
% 
% figure
% slice(mesh_x_angle,mesh_y_angle,mesh_energy,data,x_slice,y_slice,E_slice)
% shading interp
% colormap pink
% axis([ min(vector_x_angle) max(vector_x_angle) min(vector_y_angle) max(vector_y_angle) min(vector_energy) max(vector_energy)])
% xlabel('x angle (deg)')
% ylabel('y angle (deg)')
% zlabel('Kinetic energy (eV)')
% title(sprintf('Data in set %s',char(groups(choice))))

% Renaming some variables
energyvector=vector_energy;
%clear vector_energy
xanglevector=vector_x_angle;
%clear vector_x_angle
yanglevector=vector_y_angle;
%clear vector_y_angle

% Removing temp variables
%clear r answer choice groups file_date number_of_groups data_mat_dim dim_factors dim_offsets x_slice y_slice E_slice throw keep setname energy_hist_ma mesh_energy mesh_x_angle mesh_y_angle pname max_angle
%clear E_coord

