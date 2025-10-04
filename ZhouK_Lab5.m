function output = ZhouK_Lab5(input, target, target_epsilon)

% get the candidate x values in a horizontal vector for easy parsing
data = transpose(input(:,1))

% initialize a variable to store the length of the data vector
data_length = length(data);

% initialize the table
table = zeros(data_length, data_length + 1);

% --------------------STEP 1 - DETERMINE x0 and x1--------------------

% scenario 1: the target value is less than the least data point
if (target < data(1))
    
    % intialize the pointer variable to point to the greater of the initial
    % x vals
    i = 2;
    
    % initialize xu and xl
    xl = 0;
    xu = 3;
    
    % enter the first two points of the data set into the table
    table(1:2,1:2) = input(1:2,1:2);
 
% scenario 2: the target value is greater than the greatest data point
elseif (target > data(data_length))

    % initialize the pointer variable to point to the greater of the
    % initial x vals
    i = data_length;
    
    % initialize xu and xl
    xl = data_length - 2;
    xu = data_length + 1;

    % enter the last two points of the data set into the table
    table(1:2,1:2) = input(data_length-1:data_length,1:2);

% scenario 3: the target value is within the range of the data
else
    
    % initialize the pointer variable to start at 2
    i = 2;
    
    % increment the pointer variable untill it is either index out of
    % bounds, or it has found the proper initial x vals
    while (i < data_length) && (target > data(i))
        i = i + 1;
    end

    % initialize xl and xu
    xl = i - 2;
    xu = i + 1;
    
    % enter the points of the data set into the table
    table(1:2,1:2) = input(i-1:i,1:2);

end

% ------------STEP 2 - Calculate the 1st divided difference------------

table(1,3) = (table(2,2) - table(1,2)) / ((table(2,1) - table(1,1)));

