function output = ZhouK_Lab5(input, target, target_epsilon)

% get the candidate x values in a horizontal vector
data = transpose(input(:,1))

% initialize the table
table = zeros(length(data));

d1 = abs(data(1)-target);
d2 = abs(data(2)-target);
i = 2;
while (d2 < d1)
    i = i + 1;
    d1 = d2;
    d2 = abs(data(i)-target);    
end
i