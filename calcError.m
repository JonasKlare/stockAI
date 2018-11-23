function err = calcError(x,y,k) 
%Will calculate the expected k-fold error of set


size = length(x);
half = ceil(size/2)
x = x(half+1:end, :);
y = y(half+1:end,:);
%TODO calculate the size of splits before looping to save efficiency
splits = zeros(k, floor(half/k), 5); %initialize to have k columns and floor(n,k) rows. 
answers = zeros(k,floor(half/k));
count = 1;
roundedSize = half - mod(half,k)

%Separate data into k different, but same size sets. 
%Max size amount of times will be n - n %k
for i = 1:roundedSize
    j = floor(count / k)+1;
    splits(mod(i,k)+1,j,:) = x(i,:);
    count = count + 1;
end
count = 1;
%Create the y's in a similar manner that our xs are. 
for i = 1:roundedSize
    j = floor(count/k)+1;
    answers(mod(i,k)+1,j) = y(i);
    count = count+1;
end

%do every iteration of k's being placed
trainSize = roundedSize - (roundedSize/k)
xtrain = []
ytrain = []
for i = 1:k
   %create the testing set
   xtest = splits(i,:)
   ytest = answers(i,:)
   %create the training set
   for j = 1:k-1
       if(i == j)
           j = j + 1
       end
       xtrain = [xtrain,splits(j,:,:)]
       ytrain = [ytrain,answers(j,:)]
       
   end
end



