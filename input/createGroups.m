%This code is experimenting with how other similar stocks impact a stock
%End game could be to automatically create groupings that influence our
%chosen stock. 

%I'm going to hardcode how SPY impacts our info. 
function newFull = createGroups(full)
newFull = full;
%First make a new api request and sort the data into a usable form.
data = createMatrix(api("SPY"));

return newFull;