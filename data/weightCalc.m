function result = 
%Use singular value decomposition to make a least squares regression
%problem
[u,s,v] = svd(X);
%Calculate weights with the current data set. 
w = v*pinv(s)*u'*y;

%Use the last entry as the feature space
i=length(mx);
curr = createInfo(mx(1));


%Calculate resultant guess of the SVD based on weights.
result = curr * w;
