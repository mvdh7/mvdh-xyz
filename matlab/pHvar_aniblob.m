function pHvar_aniblob(x,y,c,fxlim,fylim,F)

plot(x,y, 'color',c, 'linewidth',2)
scatter(x(F),y(F),50,c,'filled')

b0x = minmax(x);
b0y = minmax(y);
patch(b0x([1 2 2 1 1]),fylim([1 1 2 2 1]),c, 'edgecolor','none', ...
    'facealpha',0.1)
patch(fxlim([1 2 2 1 1]),b0y([1 1 2 2 1]),c, 'edgecolor','none', ...
    'facealpha',0.1)

end %function
