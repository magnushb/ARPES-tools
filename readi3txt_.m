function x=readi3txt(filename)
fid=fopen(filename);
sec='';
x=[];
[pa,fi,ext]=fileparts(filename);

while(~feof(fid))
    row=fgetl(fid);
    if numel(row) && row(1)=='['
        istop=find(row==']',1)-1;
        sec=row(2:istop);
        disp(sec)
    else
        sep=find(row=='=',1);
        if ~isempty(sep)
            key=row(1:sep-1);
            value=row(sep+1:end);
        else
            key='';
            value=row;
        end
        switch sec
            case 'Region 1'
                disp(value)
                switch key
                    case 'Signal names'
                        d0=dir(fullfile(pa,[fi '*Dev1_ctr0_in*.ibw']));
                        d1=dir(fullfile(pa,[fi '*Dev1_ctr1_in*.ibw']));
                        d2=dir(fullfile(pa,[fi '*Dev1_ctr2_in*.ibw']));
                        d3=dir(fullfile(pa,[fi '*Dev1_ctr3_in*.ibw']));
                        x.files{1}={d0.name};
                        x.files{2}={d1.name};
                        x.files{3}={d2.name};
                        x.files{4}={d3.name};
                    case 'Signal steps'
                        x.steps=str2double(value);
                    case 'Signal scale'
                        x.scale=str2num(value);
                    case 'Dimension 1 scale'
                        x.scale1=str2num(value);
                    case 'Dimension 2 scale'
                        x.scale2=str2num(value);
                        d=dir(fullfile(pa,[fi '*.ibw']));
                        x.files={d.name};
                    case 'Dimension 1 size'
                        x.size=[str2double(value) 0];
                    case 'Dimension 2 size'
                        x.size(2)=str2double(value);
                end
        end
    end
end
fclose(fid);
if isfield(x,'files')
    if iscell(x.files{1})
        for i=1:4
            for j=1:numel(x.files{i})
                x.data{i}{j}=readibw(fullfile(pa,x.files{i}{j}));
            end
            if all(cellfun(@length,x.data{i})==length(x.data{i}{1}))
                x.data{i}=[x.data{i}{:}];
            end
        end
        if all(cellfun(@length,x.data)==length(x.data{1}))
            x.data=cat(3,x.data{:});
        end
    else
        for i=1:numel(x.files)
            x.data{i}=readibw(fullfile(pa,x.files{i}));
            if isfield(x,'size')
                x.data{i}=reshape(x.data{i},x.size(1),x.size(2));
            end                
        end
        if all(cellfun(@length,x.data)==length(x.data{1}))
            x.data=cat(3,x.data{:});
        end
    end
end
