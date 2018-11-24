function data = api(ticker)
%Api call to retrieve stock information
s1 = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol='
s2 = '&interval=5min&outputsize=full&apikey=WV559UNFHZPGYVMS'
data = webread(strcat(s1,ticker,s2));
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