function result = calcWeight(X,y)

%Use singular value decomposition to make a least squares regression
%problem
[u,s,v] = svd(X);
%Calculate weights with the current data set using pinv since s!inv
w = v*pinv(s)*u'*y;

%Entries are stored most recent at top - this will be our point of interest
curr = X(1,:);

%Calculate resultant guess of the SVD based on weights.
result = curr * w;
