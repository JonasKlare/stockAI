function deltas = createDeltas(curr, last)
%deltaa1,deltab1,deltac1,deltad1,deltae1

a = curr(1) - last(1);
b = curr(2) - last(2);
c = curr(3) - last(3);
d = curr(4) - last(4);
e = curr(5) - last(5);

%We want to find what the change is from the last X number of features. 
%option 1: add on to old matrix
%option 2: create new matrix for this. 

deltas = [a,b,c,d,e];