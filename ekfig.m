% Function for fast plotting of slices exported to file by BLOBSLICER

% comments were used for NdLSCO data from ADRESS, hv scans....

%function ekfig(fname,fignr)
function ekfig(mat,an,en,Ef)


%load(fname)

%mat=sliceexp.I{1,fignr};
%an=sliceexp.xscale{1,fignr};%+0.48852;
%en=sliceexp.yscale{1,fignr};%-4.5;


el=length(en);
al=length(an);

for p=1:el
    k(p,:)=angletok(an,en(p));
end

for q=1:al
    enm(:,q)=en';
end

figure;pcolor(k,enm-Ef,mat);shading flat;%colormap(hot(256))
xlabel('k_{||} (Å^{-1})')
ylabel('Binding energy (eV)')

%figure;pcolor(k,enm+4.5,mat);shading interp;colormap(hot(256))
%axis([-0.28 0.28 -0.8 0.05])

