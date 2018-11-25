function w = calcWeight(X,y)

%Use singular value decomposition to make a least squares regression
%problem
[u,s,v] = svd(X);
%Calculate weights with the current data set using pinv since s!inv
w = v*pinv(s)*u'*y;

