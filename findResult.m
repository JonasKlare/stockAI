%w is for weights and X is our matrix.
function result = findResult(w, X)
%Entries are stored most recent at top - this will be our point of interest
curr = X(1,:);

%Calculate resultant guess of the SVD based on weights.
result = curr * w;