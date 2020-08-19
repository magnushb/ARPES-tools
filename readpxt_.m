function x=readpxt(filename)
[pa,fi,ex]=fileparts(filename)
dd=dir(fullfile(pa,[fi '*.ibw']))
N=numel(dd);
n={dd.name};
x=[];
for i=1:(N/4)
    
    for j=0:3
    if i==1
        s=sprintf('ctr%d_in.ibw',j);
    else
        s=sprintf('ctr%d_in_%d.ibw',j,i-1);
    end

    disp(s)
    ii=find(~cellfun('isempty',strfind(n,s)));
    x(:,j+1,i)=readibw(fullfile(pa,n{ii}));
    end
end
