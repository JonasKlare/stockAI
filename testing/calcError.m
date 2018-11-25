function err = calcError(x,y,k) 
%Will calculate the expected k-fold error of set

addpath(genpath('../data'))

size = length(x);
%TODO calculate the size of splits before looping to save efficiency
splits = zeros(k, floor(size/k), 5); %initialize to have k columns and floor(n,k) rows. 
answers = zeros(k,floor(size/k));
count = 1;
roundedSize = size - mod(size,k);

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
trainSize = roundedSize - (roundedSize/k);


totalErr = 0;
samples = 0;
for i = 1:k
   %create the testing set
   currErr = 0;
   xtrain = [];
   ytrain = [];
   
   xtest = splits(i,:,:);
   ytest = answers(i,:);
   %create the training set
   for j = 1:k-1
       if(i == j)
           j = j + 1;
       end
       xtrain = [xtrain,splits(j,:,:)];
       ytrain = [ytrain,answers(j,:)]; 
   end
   %resize from 3d back to 2d
   xtrain = reshape(xtrain, length(xtrain),5);
   xtest = reshape(xtest, length(xtest), 5);
   
   %% Calculate guesses for the test set.
   w = calcWeight(xtrain, ytrain');
   
   
   guess = zeros(1, length(ytest));
   for i = 1:length(ytest)
       samples = samples + 1;
       guess(1,i) = sign(xtest(i,:) * w);
   end
   
   currErr = nnz(ytest - guess);
   totalErr = totalErr + currErr;
end
totalErr = totalErr
samples = samples
err = totalErr / samples



