%% Import data from Python
matfile = '../data/snakeCharming.mat';
load(matfile)
pasta = cellstr(pasta); % probably a better format to work with

% Plot x and y
figure(1); clf
scatter(x,y)

%% Do some more calculations
z = x .* y + 4;

% Append new variable to the .mat file
save(matfile, 'z', '-append')
