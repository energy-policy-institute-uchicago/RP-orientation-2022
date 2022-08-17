%% INTRODUCTION TO MATLAB
% Authors: Amedeus Akira Dsouza (BFI) and Robin Li (BFI)


%% Part I - Intro to MATLAB

clc         % Clears the command window and homes the cursor.
clear       % Use clear to empty the workspace.

cd("/YourPathHere/Intro_to_MATLAB")

%% Entering Commands 
3*5
m = 3*5             % equals sign (=) in MATLAB is the assignment operator
                    % Notice that the Workspace window (on the right) shows all the variables you have created.
n = m+1;            % If you add a semicolon to the end of a command, the result will not be displayed. The command will still be executed, as you can see in the Workspace.

%% Naming variables 
% You can name your MATLAB variables anything you'd like as long as they start with a letter and contain only letters, numbers, and underscores (_).
a = 3*5;
matlab_intro = a; 
% 3sq = 9
sq3 = 9
 
%% Saving and Loading variables
clc
clear
data = [3 0.5 4 0.5; 18 1.7 6.6 2.1; ...
        19 0.9 1.5 3.7; 20 1.6 3.6 8.5; ...
        21 3 4.7 10.1];
k = [1 2 3];

filename = "/YourPathHere/Intro_to_MATLAB/datafile.mat";

% only save matrix 'data' to datafile.mat
save filename 

save filename data

% only load matrix 'data' to datafile.mat
load filename data

%% Use built in functions and constants
b = pi; 
b1 = sin(b);
b2 = sqrt(b);

b0 = -9;            
b3 = sqrt(b0);      % Note that the solution contains the imaginary number

format long         % Format imaginary number
b3

format short         % Format imaginary number
b3

%% Vector and Matricies

% create an array x (row vector)  
x = [7 9];
size(x)

% create an array y (column vector)
y = [7; 9];
size(y)

% create a matrix z 
z = [5 6 7; 8 9 10]; 
size(z)

% create a matrix r 
r = [sqrt(10) pi^2];
r

% There is some flexibility when you create arrays. For example, these are all valid ways to create the same array
x1 = [7 9];
x2 = [7,9];
x3 = [7, 9];

% For long vectors, entering individual numbers is not practical. 
% An alternative, shorthand method for creating evenly-spaced vectors is to use the ":" operator and specify only the start and end values.
y1 = [5 6 7 8];
y2 = [5:8];
y3 = [5:0.5:8];

% If you know the number of elements you want in a vector, you can use the linspace function
% linspace(first,last,number_of_elements)
z1 = linspace(0,1,5);
z2 = z1';

z1;
z2;

%% Array Creation Functions
rand_mat1 = rand(2);    % specifies that the output will be a 2-by-2 matrix of random numbers.
rand_mat2 = rand(1,5);  % 1-by-5 matrix of random numbers

zero_mat1 = zeros(6,3);

[n, m] = size(zero_mat1);
one_mat1 = ones(n,m);

one_mat2 = ones(size(zero_mat1));


%% Indexing into Array and Modify arrays
clear
load filename data
data

% Indexing - find 2nd row and 3 column entry in data
data(2,3)

y1 = data(end, 2);    % You can use keyword "end" as either a row or column index to reference the last element.
y2 = data(5, 2);

z1 = data(end-1, 3);
z2 = data(4, 3);

% If you only use one index with a matrix, it will traverse down each column in order.
k1 = data(6);
k2 = data(1, 2);

% Matrix
x = [1 2 3; 4 5 6; 7 8 nan];
x(1,1)

% the colon operator (:) specifies all the elements in that dimension
x(2,:)
x(:,3)

%% Changing Values in Arrays
% You can change the elements in a variable by combining indexing with assignment.
clc
x

x(1,2) = 4;
x

x(isnan(x)) = inf;
x

x(x < 2) = nan;
x

% changing the first column to the second column
x(1,:) = x(2,:);
x

%% Performing Array Operations on Vectors
clc 
v1 = data(:,3);
v2 = data(:,4);

% add/subtract any two arrays of the same size.
v_add = v1 + v2; 

% multiply or divide all of the elements of an array by a scalar.
v3 = 2 * v1;
v4 = v2 / 2;

% The maximum value of a vector can be determined using the max function.
v4Max = max(v4);

dataMax1 = max(data);        % For N-D arrays, max(X) operates along the first non-singleton dimension
dataMax2 = max(data, [], 2); % Operates along the row, containing the maximum value of each row.
dataMax3 = max(data, [], 'all'); % Returns the largest element of X

% Matrix multiplication & Elementwise multiplication
v5 = v1 * v2';
size(v5) 

v6 = v1 .* v2;
v7 = v1 .^ v2;
size(v6)

%% Obtaining Multiple Outputs
% SIZE function: can be applied to a matrix to produce either a single output variable or two output variables. 
% Use square brackets ([ ]) to obtain more than one output.
[xrow,xcol] = size(data);

% MAX function: You can find the maximum value of a vector and its corresponding index value using the MAX function.
% First output from the max function is the maximum value of the input vector. 
% When called with two outputs, the second output is the index value.
[xMax,idx] = max(x);

% If you only need the second output from a function, you can use a tilde (~) to ignore specific outputs.
density = data(:,2);
[~,ivMax] = max(v2);
densityMax = density(ivMax);


%% Obtaining Help for Functions
help randi;

doc randi;


%% Plotting vectors
clc
clear
load datafile
sample = data(:,1);
density = data(:,2);
v1 = data(:,3);
v2 = data(:,4);
mass1 = density.*v1;
mass2 = density.*v2;

% Two vectors of the same length can be plotted against each other using the plot function: plot(x,y)
% connected lines
plot(sample, mass1);
hold off

plot(sample, mass1);
hold on 
plot(sample, mass2, "r--o");    % red, dash line, circle marker
hold off
% While the hold state is on, plots will continue to go on the same axes.
% To return to the default plot behavior, where each plot gets its own axes, enter hold off

% scatter plot
plot(sample, mass1, "r*");      % red, star marker
hold on 
plot(sample, mass2, "ks");      % black, square marker
hold off

% plot function accepts optional additional inputs consisting of a property name and an associated value.
plot(sample, mass1, "r-o","LineWidth",1);
hold on 
plot(sample, mass2, "k--*","LineWidth", 2);
title("Plot Title");
ylabel("Mass");
xlabel("Sample");
legend("Mass1","Mass2")
hold off 


%% Importing data
clc
clear
elements = readtable("/YourPathHere/Intro_to_MATLAB/element.csv");

column_v1 = elements.Quantity1;

% Computation between columns
elements.Total = elements.Quantity1 .* elements.Price; 
% If the variable data.HeightMeters doesn't exist, MATLAB will create a new variable in the table with the name HeightMeters.

% Extract table variables
top3 = elements(1:3,:);     % Note this is also a table


%% Logical Indexing
% Common relational operators: >, <, == (eq), ~= (neq), & (and), | (or) 
% The outcome of a comparison for equality or inequality is either 1 (true) or 0 (false).
clc
clear
x = pi < 4; 

load datafile
sample = data(:,1);
v1 = data(:,3);

y = v1 < 4; 
% The result is a logical array of the same size as the original array.

z = v1(v1<4);

% Modify v1 so that any value less than 4 is replaced with the value 0.
v1(v1<4) = 4;


%% Programming 
clc
clear

% loop 
i = 0;
for t1 = 0:1:10
    i = i + 1;
    y1(i) = sin(t1);
end
y1 

% Vectorized version of the same code, using vectorization, you can write a much more concise MATLAB process
t2 = 0:1:10;
y2 = sin(t2);
y2

% if statement
x = randi([0 1]);
if x == 1 
    disp('Hello')
end

x = rand;
x
if x > 0.5 
    y = 3; 
else 
    y = 4;
end    

% The elseif keyword can be used after if to add more conditions.



%% Part II - Some Useful Functions - Everything here on out can be Googled

clear

% Evaluate selection: Shift+F7, alternatively add breakpoints while running
% script to debug

% cmd+/ to comment (ctrl+r for windows); cmd+t to uncomment

%% repmat - Repeat copies of array
A       = [1 2; 3 4];
A2      = repmat(A, 2);     % creates 2 copies in the row and in the column direction
A23     = repmat(A, 2, 3);  % creates 2 copies in the row and 3 copies in the column direction
A23_alt = repmat(A, [2 3]); % can also specify repitition scheme through array

%% sparse - Create sparse matrix
% Converts a full matrix into sparse form by squeezing out any zero elements. If a matrix contains many zeros, converting the matrix to sparse storage saves memory.
A = eye(10000);
whos A          % 800MB worth of memory; whos - list variables in workspace, with sizes and types
S = sparse(A);
whos S          % 0.25MB worth of memory

%% reshape - Reshape array
A = 1:10;
B = reshape(A, [5 2]);  % 5*2 = 10 = numel(A) ; reshapes 1-by-10 vector into a 5-by-2 matrix

A = magic(4);           % creates magic square - sum along all dimensions equal
B = reshape(A,[],2);    % [] for the first dimension lets reshape calculate the appropriate number of rows

A = zeros(3,2,3);
B = reshape(A,9,2);      % works for multidimensional arrays as well

%% accumarray - Accumulate vector elements
month       = [ 1  1  2  2  2  3  5]';   % consider 5 month period, collecting temperature data, multiple readings in 1 and 2, no readings in 4
temp_data   = [-5 -6  2  4 -1 10 32]';   
max_temp = accumarray(month, temp_data, [5 1], @max); % third arg = sz of resulting vector, fourth arg = function

% B = accumarray(I,D) sums groups of data by accumulating elements of a vector D according to the groups specified in I. The sum is then computed over each group. 
index = [1 3 4 2 4 1]';
data  = (1:6)';
A     = accumarray(index,data);         % default function - sum data by group specified in index

index = [1 1 4 2 4 3]';
A = accumarray(index,1);                % count elements in group; apply scalar expansion to 1 and take sum by index

index = [1 1; 2 2; 3 2; 1 1; 2 2; 4 1; 1 2]; % row represents group assignment and n-dimensional index into the output
data  = (1:7)';
A     = accumarray(index, data);
% (1,1) = 5: sum of all rows of type (1,1) i.e. 1+4 with output stored in column 1
% (1,2) = 7: sum of all rows of type (1,2) i.e. 7   with output stored in column 2
% (2,1) = 0: DNE
% (2,2) = 7: sum of all rows of type (2,2) i.e. 2+5 with output stored in column 2

%% sub2ind - Convert subscripts to linear indices
% Consider two ways of locating elements in a 3x3 matrix:

% 1. Subscripts - indexing by position
% A = [(1,1), (1,2), (1,3); (2,1), (2,2), (2,3); (3,1), (3,2), (3,3)]

% 2. Linear Indices
linear_indices = [1 2 3; 4 5 6; 7 8 9]'; % Note: notice the transpose

% Convert between the two as follows
% Specify the row and column subscripts
row = [1 2 3 1];
col = [2 2 2 3];
% For the first element interested in (1,2), second element (2,2), third (3,2), fourth (1,3)
% Specify size of the matrix
sz = [3 3]; 
% Convert
A = sub2ind(sz, row, col);

% Test
mat = rand(3, 3)
mat(1, 2) 
mat(4)

%% Making diagonal matrices

% diag - Create diagonal matrix or get diagonal elements of matrix
v = [1 2 3 4];
D = diag(v);    % returns a square diagonal matrix with the elements of vector v on the main diagonal.

% diag(v,k) places the elements of vector v on the kth diagonal. k=0 represents the main diagonal, k>0 is above the main diagonal, and k<0 is below the main diagonal.
Dsup1 = diag(v,1);  % returns a matrix with elements of v on the first super diagonal 
Dsub1 = diag(v,-1); % returns a matrix with elements of v on the first sub   diagonal

% diag also returns the diagonal of a matrix
A = [1 2 3; 4 5 6; 7 8 9];
D = diag(A);
Dsup1 = diag(A,1);
Dsub1 = diag(A,-1);

% spdiags - Create diagonal matrix with more than one diagonal
va = [-2 -2 -2 -2 -2]';
vb = [ 1  2  3  4  5]';
vc = [ 3  3  3  3  3]';
D = spdiags([va vb vc],-1:1,5,5); % first arg = diagonals, second arg = where to place the diagonals, third+ = size of resulting mat
Dmat = full(D); % converts from sparse storage to full


vd = [1 1 1 1 1]'; % can also change specific diagonal
Dnew = spdiags(vd, 0, D);
Dnew_mat = full(Dnew);

% spdiags also extracts the nonzero entries of a matrix
Dmat_vals = spdiags(Dmat);

%% squeeze - Remove dimension of length 1

% B = squeeze(A) returns an array with the same elements as the input array A, but with dimensions of length 1 removed.

% Consider 2x1x2 array
A = zeros(2,1,2);
A(:,:,1) = [1 2]';
A(:,:,2) = [3 4]';

B = squeeze(A); % returns 2x2 array

% Consider 1x1x3 array
A = zeros(1,1,3);
A(:,:,1:3) = [1 2 3];

B = squeeze(A); % returns 3x1 array

%% Optimization

% MATLAB can solve two types of optimization problems:
% Zero finding: Find x such f(x) = 0
% Minimization: min f(x)

% A maximization problem can be solved by minimizing the negative of the function

% Zero Finding:

% Define the objective function as an anonymous function
objFun = @(x) sin(x) + cos(x);

% Plot the objective function
ezplot(objFun , [-3,3])

% Optimize it with zero as initial guess
[x, val] = fzero(objFun , 0)   % initial point = 0

% Find the zero at the right
[x, val] = fzero(objFun, [0 3])


% Minimization - 1D

% Define the objective function as an anonymous function
objFun = @(x) sin(x) + cos(x);

% Plot the objective function
ezplot(objFun , [-3,3])

% Search for a minimum between -3 and 0
[x, val] = fminbnd(objFun , -3, 0)

% Find for a maximun between -1 and 2
[x, val] = fminbnd(@(x) -objFun(x), -1, 2)


% Minimization - 2D

% Define the objective function as an anonymous function
objFun = @(x) sin(x(1))*cos(x(2)); 
objFunPlot = @(x,y) sin(x).*cos(y);

% Plot the objective function
ezsurf(objFunPlot , [-3,3])

% Search for a minimum with guess (0,0)
[x, val] = fminsearch(objFun, [0,0])

% Search for a maximum with guess (0,0)
[x, val] = fminsearch(@(x) -objFun(x), [0,0])



%% References

% https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted
% https://cheatsheets.quantecon.org
% https://www.mathworks.com/help/matlab
% https://www.javierbarbero.net/wp-content/uploads/2014/10/IntroOptimization.pdf



