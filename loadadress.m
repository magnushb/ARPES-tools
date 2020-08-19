% Script for loading data from the ADRESS beamline at SLS

% Select data file (*.h5 file)
[fname, pname] = uigetfile('*.h5','Select datafile');
cd(pname)

[data_,note]=adress2slicer(sprintf('%s%s',pname,fname));