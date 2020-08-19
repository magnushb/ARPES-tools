% Save data matrix and axes vectors for specific figure in exported
% blobfile (from blobslicer)

function blobdump(figurenr)

[fname, pname] = uigetfile('*.mat','Select datafile');
load(fname)
