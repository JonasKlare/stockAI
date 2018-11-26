function bet = stock(ticker)
addpath(genpath('input'))
addpath(genpath('testing'))
addpath(genpath('data'))

%% Data creation
%retrieve data from MSFT
jsonResponse = api(ticker);
%format matrix and create a series of correct values
[X,y] = createMatrix( jsonResponse );

%% Singular value decomposition
weights = calcWeight(X,y);
result = findResult(weights, X)
bet = sign(result);

%% Section for Errors
err = 0;
err = calcError(X, y, 4)


    





