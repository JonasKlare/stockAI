function [full,y] = createMatrix(mx)

addpath(genpath('../data'))

examples = size(mx) -2;
full = zeros(examples(1), 5);
%Used to keep track of session data (Before testing update)
y = zeros(examples(1),1);

%Extract the data from these structs.  
for i = 2:(length(mx))
    
    %Create entries up until y can't be calculated.
    if(i<length(mx))
        next = createInfo(mx(i));
        full(i,:) = next;
        d2 = str2double(mx(i+1).x4_Close);
        y(i) = sign(d2-next(4));
    end
end