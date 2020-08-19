function [angle,mat] = nrfile(filename)

m='';
k=0;
fid = fopen(filename);

if fid == -1
    msgbox(['Cannot open file ' filename],'Error')
end

label = 'Dimension 2 scale';
for n=1:40
 line = fgetl(fid);
   if length(line) >= 17
      if strcmp(line(1:17),label)
         m = strvcat(m,line); 
         break
      end  
   end
 m = strvcat(m,line); 
 k = k+1;
end

k = k + 1;
p = m(size(m,1),:);
r = m(size(m,1),19:length(p));
angle = str2num(r);
angle = angle';

m = '';
label2 = '[Data 1]';
for n=1:50
 line = fgetl(fid);
 if length(line) >= 8
    if strcmp(line(1:8),label2)
         m = strvcat(m,line); 
         break
    end  
 end
 m = strvcat(m,line);       
 k = k + 1; 
end

p = m(size(m,1),:);
k = k + 1;
mat = dlmread(filename,'', k, 0);

c1 = size(angle,1)+1;
c2 = size(mat,1)/c1;
if size(mat,2)==1 
	nmat = reshape(mat',c1,c2);
	nmat = nmat';
    mat = nmat;
end

if size(mat,2)-1 > size(angle,1)
    mat = mat(:,1:end-1);
end

st=fclose(fid);