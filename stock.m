function bet = stock()
addpath(genpath('input'))
addpath(genpath('testing'))
addpath(genpath('data'))

%% Data creation
%retrieve data from MSFT
mx = api('MSFT');
%format matrix and create a series of correct values
[X,y] = createMatrix(mx)

%% Singular value decomposition
result = calcWeight(X,y);

%% Section for Errors
err = calcError(X, y, 3);


    





