% Function for extracting a series of MDC fits at different binding energies

function ret=mdcseries(mat,angl,matel,intg)


mdc=getmdc(mat,matel,intg);
[ret.ampl,ret.peaks,ret.FWHMs,ret.a,ret.b,ret.angle,ret.fits]=mdcfit(angl,mdc,'ind','',1000);
num=size(ret.fits);
ret.num=num(1);
ret.matel=matel;
ret.mdc=mdc;