function Ek = dispfit(x,xdata,bpl,fpl,fpr,bpr)

xpossig=xdata(1:bpl+fpr);
xnegsig=xdata(bpl+fpr+1:bpl+fpl+fpr+bpr);

Eksigpos = dispfitsigpos(x,xpossig);
Eksigneg = dispfitsigneg(x,xnegsig);


Ek=[Eksigpos Eksigneg];
