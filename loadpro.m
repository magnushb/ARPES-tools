%%% Script for loading project files (as saved using savepro)

function loadpro(varargin)


if numel(varargin) == 0
    % prompt for file
    [fname, pname] = uigetfile('*.mat*','Select Project File List');
    load(strcat(pname,fname))
else
    % use input name as loading name
    load_name=varargin{1,1};
    load(load_name)
end


for t=1:length(C)
    edit(C{t})
end
