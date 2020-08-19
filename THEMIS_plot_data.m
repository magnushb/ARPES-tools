h=hdf5info('AgFermiC.h5');

look_at_dataset=1;


data=hdf5read(h.GroupHierarchy.Groups(1,1).Datasets);

dimensions=h.GroupHierarchy.Groups(1,1).Datasets.Dims;
min_enegy=h.GroupHierarchy.Groups(1,1).Datasets.Attributes(1,16).Value;
max_enegy=h.GroupHierarchy.Groups(1,1).Datasets.Attributes(1,17).Value;
max_angle=h.GroupHierarchy.Groups(1,1).Datasets.Attributes(1,18).Value;

angle_int=sum(sum(data,3),2);

plot(angle_int)

[x,y,z]=meshgrid(linspace(-max_angle,max_angle,dimensions(1,2)),linspace(6,6.4,dimensions(1,1)),linspace(-max_angle,max_angle,dimensions(1,3)));
%slice(x,y,z,double(data),0,6.1,0)