function deltas = createDeltas(features, full, curr)
%deltaa1,deltab1,deltac1,deltad1,deltae1
%{
deltaa1 = a - lastResult(1);
deltab1 = b - lastResult(2);
deltac1 = c - lastResult(3);
deltad1 = d - lastResult(4);
deltae1 = e - lastResult(5);
%}
%We want to find what the change is from the last X number of features. 
%option 1: add on to old matrix
%option 2: create new matrix for this. 
return 0