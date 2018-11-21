function err = calcError(x,y,k) 
%Will calculate the expected k-fold error of set

%Separate data into k different, but same size sets. 
%Max size amount of times will be n - n %k
size = length(x);
splits = [];
for i = 1:size - size%k
    for j = 1:k
        %Cycle through adding one to each array.
    end
end


