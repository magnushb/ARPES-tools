% write file name as 'testpic.pgm'
function pgmwrite(im,filename)
fid=fopen(filename,'w');
fprintf(fid,'P5\n%d %d\n255\n',size(im,2),size(im,1));
fwrite(fid,im','uint8');
fclose(fid);

% to convert pgm file to something else, write: gm convert filename.pgm converted.gif (or .png or .jpg)