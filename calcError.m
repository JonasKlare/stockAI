function err = calcError(x,y,k) 
%Will calculate the expected k-fold error of set


size = length(x);
%TODO calculate the size of splits before looping to save efficiency
splits = []; %initialize to have k columns and floor(n,k) rows. 
count = 1;

%Separate data into k different, but same size sets. 
%Max size amount of times will be n - n %k
for i = 1:size - mod(size,k)
    for j = 1:k
        %Cycle through adding one to each array.
        splits(j) = [splits(j); x(count)];
        count += 1;
    end
end

%not the right value right now
return count;


