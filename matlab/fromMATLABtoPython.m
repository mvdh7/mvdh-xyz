%% Indexing
letters = {'a' 'b' 'c'};
disp(letters{1}) % prints out 'a'

%% The perils of =
x = [2 4 6 8 10]; % define x
y = x;            % copy x into y
x(3) = 99;        % change 3rd value of x to 99
disp(x) % prints out  2  4 99  8 10
disp(y) % prints out  2  4  6  8 10
