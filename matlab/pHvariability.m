types = {'initial' 'constant_Hconc' 'constant_pH' 'same_baseline'};

type = types{1};

filename = ['figures/pHvar_' type '.gif'];
DelayTime = 0.04;

fx = linspace(1e-9,1e-7,200);
fy = -log10(fx);

% Set colours
c1 = [1 0.1 0];
c0 = [0 0.5 1];

% 
FTOT = 80;
swave = sin(0:(2*pi/FTOT):(2*pi-2*pi/FTOT));

SeasAmp = 0.2;

y0 = swave * SeasAmp + 8.2;
x0 = 10.^-y0;

switch type
        
    case 'same_baseline'
        y1 = swave * SeasAmp*1.5 + 8.2;
        x1 = 10.^-y1;
        
    case 'constant_pH'
        y1 = swave * SeasAmp + 7.6;
        x1 = 10.^-y1;
        
    case 'constant_Hconc'
        x1 = -swave * (max(x0) - min(x0)) / 2 + 10^-7.6;
        y1 = -log10(x1);
        
end %switch

for F = 1:FTOT

fig = figure(1); clf; hold on
set(fig, 'color','w', 'units','centimeters')
set(fig, 'position',[-30 10 15 12.1])
    
% Limits
% fxlim = [0 max(fx)];
% fylim = -log10(fliplr(minmax(fx)));
fxlim = [0 0.060000000001]*1e-6;
fylim = [7 8.6];

xlim(fxlim)
ylim(fylim)

% Draw baseline pH
plot(fx,fy,'k', 'linewidth',1)

% Animated blobs
if ~strcmp(type,'initial')
    pHvar_aniblob(x1,y1,c1,fxlim,fylim,F)
end %if
pHvar_aniblob(x0,y0,c0,fxlim,fylim,F)
if strcmp(type,'same_baseline')
    scatter(x1(F),y1(F),50,c1,'filled')
    scatter(x0(F),y0(F),50,c0,'filled')
end %if

% Labels
xlabel(['[H^+] / ' char(956) 'mol\cdotkg^{' char(8211) '1}'])
ylabel([char(8211) 'log_{10} [H^+] ? pH'])

% Axis settings
setaxes(gca,12)
set(gca, 'box','on', 'xtick',(0:0.02:0.1)*1e-6, 'ytick',7:0.4:9)
set(gca, 'xticklabel',num2str(1e6*get(gca,'xtick')','%.2f'), ...
         'yticklabel',num2str(    get(gca,'ytick')','%.1f'))
    
% Position
set(gca, 'position',[0.12 0.13 0.6 0.7])

% Annotations
if strcmp(type,'same_baseline')
    
    text(0.072*1e-6,y0(1)+0.15,{'Initial \DeltapH' [' = ' ...
    num2str(max(y0) - min(y0),'%.2f')]}, ...
    'color',c0, 'fontname','arial', 'fontsize',15, ...
    'horizontalalignment','center')
    
    text(0.072*1e-6,y1(1)-0.15,{'Final \DeltapH' [' = ' ...
        num2str(max(y1) - min(y1),'%.2f')]}, ...
        'color',c1, 'fontname','arial', 'fontsize',15, ...
        'horizontalalignment','center')
    
end %if

if ~ strcmp(type,'same_baseline')
    text(0.072*1e-6,y0(1),{'Initial \DeltapH' [' = ' ...
        num2str(max(y0) - min(y0),'%.2f')]}, ...
        'color',c0, 'fontname','arial', 'fontsize',15, ...
        'horizontalalignment','center')
end %if

text(x0(1),8.85,{'Initial \Delta[H^+]' [' = ' ...
    num2str((max(x0) - min(x0))*1e6,'%.3f')]}, ...
    'color',c0, 'fontname','arial', 'fontsize',15, ...
    'horizontalalignment','center')

if ~strcmp(type,'initial')
       
    if ~ strcmp(type,'same_baseline')
        text(0.072*1e-6,y1(1),{'Final \DeltapH' [' = ' ...
            num2str(max(y1) - min(y1),'%.2f')]}, ...
            'color',c1, 'fontname','arial', 'fontsize',15, ...
            'horizontalalignment','center')
    end %if
    
    text(0.028e-6,8.85,{'Final \Delta[H^+]' [' = ' ...
        num2str((max(x1) - min(x1))*1e6,'%.3f')]}, ...
        'color',c1, 'fontname','arial', 'fontsize',15, ...
        'horizontalalignment','center')
    
end %if

% Capture the plot as an image 
frame = getframe(fig); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 

if F == 1

    imwrite(imind,cm,filename,'gif', 'DelayTime',DelayTime, ...
        'LoopCount',Inf)

else

    imwrite(imind,cm,filename,'gif', 'WriteMode','append', ...
        'DelayTime',DelayTime)

end %if
    
    
end %for F
