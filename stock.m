function bet = stock()
addpath(genpath('input'))
addpath(genpath('testing'))
addpath(genpath('data'))
%Api call to retrieve stock information
data = webread('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=BBY&interval=5min&outputsize=full&apikey=WV559UNFHZPGYVMS');
mx = cell2mat(struct2cell(data.TimeSeries_5min_));
examples = size(mx) -2;
full = zeros(examples(1), 5);
%Used to keep track of session data (Before testing update)
y = zeros(examples(1),1);

%Extract the data from these structs.  
for i = 2:(length(mx))
    
    %Create entries up until y can't be calculated.
    if(i<length(mx))
        next = createInfo(mx(i), full, i);
        full = [full;next];
        d2 = str2double(mx(i+1).x4_Close);
        y= [y;sign(d2-next(4))];
    end
end

%% Create the SVD and make the guess
%Use singular value decomposition to make a least squares regression
%problem
[u,s,v] = svd(full);
%Calculate weights with the current data set. 
w = v*pinv(s)*u'*y;

%Use the last entry as the feature space
i=length(mx);
curr = createInfo(mx(1), full, 1)


%Calculate resultant guess of the SVD based on weights.
result = curr * w
%Make Money?!?!
bet = sign(result)
%% Section for Errors
err = calcError(full, y, 3);


    





