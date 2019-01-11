%% Simulate dataset to play with
clear ts
ts.dist = (0:50:1000)'; % distance along the estuary
ts.sal = 1 + ts.dist * 34/1000 + 0.1*randn(size(ts.dist)); % salinity
ts.no3 = 10 * exp(-ts.dist/3e2) + 0.05*randn(size(ts.dist)); % nitrate
ts = struct2table(ts);


%% Super basic plotting
figure(1); clf

scatter(ts.dist,ts.sal) % data points


%% Now add a mixing line and second subplot

% Calculate gradient and intercept of mixing line
mixLineGradient = diff(ts.sal([1 end])) / diff(ts.dist([1 end]));
mixLineIntercept = ts.sal(1);

% Create mixing line function of distance
mixLineFunction = @(dist) mixLineIntercept + mixLineGradient * dist;

% Draw figure
figure(1); clf

subplot(2,1,1); hold on

    scatter(ts.dist,ts.sal) % data points
    plot(ts.dist([1 end]),ts.sal([1 end])) % mixing line

subplot(2,1,2)

    scatter(ts.dist,ts.sal - mixLineFunction(ts.dist)) % residuals

    
%% As above, but with dynamic y-axis variable

fyvar = 'sal';

% Calculate gradient and intercept of mixing line
mixLineGradient = diff(ts.(fyvar)([1 end])) / diff(ts.dist([1 end]));
mixLineIntercept = ts.(fyvar)(1);

% Create mixing line function of distance
mixLineFunction = @(dist) mixLineIntercept + mixLineGradient * dist;

% Draw figure
figure(1); clf

subplot(2,1,1); hold on

    scatter(ts.dist,ts.(fyvar)) % data points
    plot(ts.dist([1 end]),ts.(fyvar)([1 end])) % mixing line

subplot(2,1,2)

    scatter(ts.dist,ts.(fyvar) - mixLineFunction(ts.dist)) % residuals
    
    
%% Add axis labels, and a switch block to set their values

% Decide which variable to plot
fyvar = 'sal';

% Variable-specific settings
switch fyvar
    
    case 'sal'
        fylabel = 'Salinity';
        
    case 'no3'
        fylabel = 'Nitrate';
        
end %switch

% Calculate gradient and intercept of mixing line
mixLineGradient = diff(ts.(fyvar)([1 end])) / diff(ts.dist([1 end]));
mixLineIntercept = ts.(fyvar)(1);

% Create mixing line function of distance
mixLineFunction = @(dist) mixLineIntercept + mixLineGradient * dist;

% Draw figure
figure(1); clf

subplot(2,1,1); hold on

    scatter(ts.dist,ts.(fyvar)) % data points
    plot(ts.dist([1 end]),ts.(fyvar)([1 end])) % mixing line
    
    xlabel('Distance')
    ylabel(fylabel)

subplot(2,1,2)

    scatter(ts.dist,ts.(fyvar) - mixLineFunction(ts.dist)) % residuals
    
    xlabel('Distance')
    ylabel([fylabel ' residuals'])
    
    
%% Use a loop to plot nitrate and salinity side by side

% Define list of variables to plot
fyvars = {'sal' 'no3'};

% Draw figure
figure(1); clf

% Loop through the variables in fyvars
for V = 1:numel(fyvars)

% Pick which variable to plot from fyvars
fyvar = fyvars{V};

% Variable-specific settings
switch fyvar
    
    case 'sal'
        fylabel = 'Salinity';
        
    case 'no3'
        fylabel = 'Nitrate';
        
end %switch

% Calculate gradient and intercept of mixing line
mixLineGradient = diff(ts.(fyvar)([1 end])) / diff(ts.dist([1 end]));
mixLineIntercept = ts.(fyvar)(1);

% Create mixing line function of distance
mixLineFunction = @(dist) mixLineIntercept + mixLineGradient * dist;

subplot(2,2,(V-1)*2+1); hold on

    scatter(ts.dist,ts.(fyvar)) % data points
    plot(ts.dist([1 end]),ts.(fyvar)([1 end])) % mixing line
    
    xlabel('Distance')
    ylabel(fylabel)

subplot(2,2,2*V)

    scatter(ts.dist,ts.(fyvar) - mixLineFunction(ts.dist)) % residuals
    
    xlabel('Distance')
    ylabel([fylabel ' residuals'])
    
end %for V
