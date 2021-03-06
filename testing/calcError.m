function err = calcError(x,y,k) 
%Will calculate the expected k-fold error of set

addpath(genpath('../data'))
numFeat = 5;

size = length(x);
%TODO calculate the size of splits before looping to save efficiency
splits = zeros(k, floor(size/k), numFeat); %initialize to have k columns and floor(n,k) rows. 
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
   for j = 1:k
       if(i == j)
           %skip this
       else
         xtrain = [xtrain,splits(j,:,:)];
         ytrain = [ytrain,answers(j,:)]; 
       end
   end
   %resize from 3d back to 2d
   xtrain = reshape(xtrain, length(xtrain),numFeat);
   xtest = reshape(xtest, length(xtest), numFeat);
   
   %% Calculate guesses for the test set.
   w = calcWeight(xtrain, ytrain');
   
   
   guess = zeros(1, length(ytest));
   for p = 1:length(ytest)
       samples = samples + 1;
       guess(1,p) = sign(xtest(p,:) * w);
   end
   
   currErr = nnz(ytest - guess);
   totalErr = totalErr + currErr;
end

err = totalErr / samples;



