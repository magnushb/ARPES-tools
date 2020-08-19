%%% Script for saving a list of open m-files.
%%% The list can be loaded at a later time, using 'loadproject.m', automatically 
%%% opening all files related to the project


function savepro()

% get file list
ES = com.mathworks.mlservices.MLEditorServices;
OpenFiles = ES.builtinGetOpenDocumentNames;
C = cell(1, numel(OpenFiles));
for t = 1:length(C)
   C{t} = char(OpenFiles(t));
end 

% save file list to file
uisave('C','ProjectFiles');
