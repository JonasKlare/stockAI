function result = createInfo(features, full, curr)
%given a series of structs convert those into numbers
%standard 5 features
 a = str2double(features.x1_Open);
 b = str2double(features.x2_High);
 c = str2double(features.x3_Low);
 d = str2double(features.x4_Close);
 e = str2double(features.x5_Volume);
 
%additional features based on deltas
lastResult = full(curr,:);
deltaa1 = a - lastResult(1);
deltab1 = b - lastResult(2);
deltac1 = c - lastResult(3);
deltad1 = d - lastResult(4);
deltae1 = e - lastResult(5);

result = [a,b,c,d,e,deltaa1,deltab1,deltac1,deltad1,deltae1];
