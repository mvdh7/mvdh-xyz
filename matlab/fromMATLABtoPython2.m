%% Implicit dimensions
N = 15;
disp(N(1,1,1,1,1,1,1)) % prints out 15. I could go on

%% Accessing rows and columns
x = [1 2 3; 4 5 6];
disp(x(2))   % prints out the second value i.e. 4
disp(x(2,1)) % prints out row 2 column 1 i.e. 4
disp(x(2,:)) % prints out the second row i.e. [4 5 6]
disp(x(:,2)) % prints out the second column i.e. [2; 5]
disp(x(:,2,:,:)) % works just like the previous one

%% Matrix maths
A = [1 2; 3 4];
b = [9; 10];
C = A  * b; % returns [29; 67]
v = A .* b; % returns  [9 18; 30 40]

%% Shape and size
% x defined in earlier example
disp(numel(x)) % returns 6
disp( size(x)) % returns [2 3]

%% Sequences
disp(0:2:10) % [0 2 4 6 8 10]

%% Fitting

% Simulate some data to fit
t = 1:10;
n = t*2 + 1 + randn(size(t));

% Subsequent code generated by the curve fitting app
[xData, yData] = prepareCurveData( t, n );

% Set up fittype and options.
ft = fittype( 'm*x+c', 'independent', 'x', ...
    'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.824590668780614 0.470923348517591];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Show the coefficient values
disp(coeffvalues(fitresult))

%% In-line function definition
ilfunc = @(var) var * 2;
disp(ilfunc(3)) % returns 3 * 2 = 6
