function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns

if nargin ~= 2
    error('Please input 1 row and 1 column number.')
end
A = zeros(n,m);

for i = 1:n
    for k = 1:m
        if i == 1
            A(i,k) = k;
        elseif k == 1
            A(i,k) = i;
        else
            A(i,k) = A(i-1,k) + A(i,k-1);
        end
    end
end
disp(A)