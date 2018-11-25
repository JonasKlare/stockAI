function mx = api(ticker);
%Api call to retrieve stock information
addpath(genpath('../input'))
s1 = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=';
s2 = '&interval=5min&outputsize=full&apikey=WV559UNFHZPGYVMS';
data = webread(strcat(s1,ticker,s2));
mx = cell2mat(struct2cell(data.TimeSeries_5min_));
