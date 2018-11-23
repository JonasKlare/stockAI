function result = createInfo(features, full, curr)
%given a series of structs convert those into numbers
%standard 5 features
 a = str2double(features.x1_Open);
 b = str2double(features.x2_High);
 c = str2double(features.x3_Low);
 d = str2double(features.x4_Close);
 e = str2double(features.x5_Volume);


result = [a,b,c,d,e];
