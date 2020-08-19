[fname, pname] = uigetfile('*.*','Select datafile');
[angl,mat] = nrfile( strcat(pname,'\',fname));

if length(angl) > 0
	clf
	ener = mat(:,1);
    kspace=sin(angl/180*pi)*0.5123*sqrt(5.69);
	mat = (mat(:,2:size(mat,2)));
	if 1 
         %pcolor(kspace,ener,mat), shading interp, %colorbar   
         pcolor(angl,ener,mat), shading interp, colorbar   
    else
         pcolor(mat), shading interp, colorbar
    end
        title(fname), 
    else
        msgbox('No data!','Error')    
end


