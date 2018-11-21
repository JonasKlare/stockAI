
%Api call to retrieve stock information
data = webread('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=5min&outputsize=full&apikey=WV559UNFHZPGYVMS');
mx = cell2mat(struct2cell(data.TimeSeries_5min_));
full = [];

%Used to keep track of session data (Before testing update)
y = [];

%Extract the data from these structs.  
for i = 2:(length(mx))
    a = str2num(mx(i).x1_Open);
    b = str2num(mx(i).x2_High);
    c = str2num(mx(i).x3_Low);
    d = str2num(mx(i).x4_Close);
    e = str2num(mx(i).x5_Volume);
    
    %Create entries up until y can't be calculated.
    if(i<length(mx))
        next = [a,b,c,d,e];
        full = [full;next];
        d2 = str2num(mx(i+1).x4_Close);
        y= [y;sign(d2-d)];
    end
end

%Use singular value decomposition to make a least squares regression
%problem
[u,s,v] = svd(full);
%Calculate weights with the current data set. 
w = v*pinv(s)*u'*y;

%Use the last entry as the feature space
i=length(mx);
a = str2num(mx(1).x1_Open);
b = str2num(mx(1).x2_High);
c = str2num(mx(1).x3_Low);
d = str2num(mx(1).x4_Close);
e = str2num(mx(1).x5_Volume);

curr = [a,b,c,d,e];

%Calculate resultant guess of the SVD based on weights.
result = curr * w
%Make Money?!?!
bet = sign(result)

calcError(full,y,2)


    





