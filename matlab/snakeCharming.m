%% Import data from Python
matfile = '../data/snakeCharming.mat';
load(matfile)
pasta = cellstr(pasta); % probably a better format to work with

% Plot x and y
figure(1); clf
scatter(x, y)

%% Do some more calculations
z = x .* y + 4;

% Append new variable to the .mat file
save(matfile, 'z', '-append')

%% Load up Python in MATLAB
load('../data/pyexe.mat') % get path to Python executable

% Check if Python already loaded
[~, ~, pyloaded] = pyversion;

% Load Python if not already loaded
if ~pyloaded
    pyversion(pyexe);
end %if

%% Check that we can import numpy
np = py.importlib.import_module('numpy');

%% Calculate sine of some numbers using numpy
x = [1 2 3 4 5];
sines = np.sin(x);

% or if we hadn't done the previous importlib step
sines2 = py.numpy.sin(x);

%% Convert result into a MATLAB-friendly format
msines = double(py.array.array('d', sines));
