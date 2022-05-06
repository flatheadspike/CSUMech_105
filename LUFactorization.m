function [L, U, P] = LUFactorization(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix


[a,b] = size(A);

if a ~= b
    error('Matricies do not allign in size')
end

v = length(A);
P = eye(v);
L = zeros(v);
U = A;


for i = 1:v-1
    %Switching rows
    [M,I] = max(abs(U(i:v,i)));
    I = I+(i-1);
    if M == 0
        eror('The matrix can not be pivoted')
    end
    U([i,I],:) = U([I,i],:);
    L([i,I],:) = L([I,i],:);
    P([i,I],:) = P([I,i],:);

    % Elimination
    for I = i+1:v
        factor = -U(I,i) / U(i,i);
        U(I,:) = U(I,:) + factor * U(i,:);
        L(I,i) = -factor;
    end
end

L = L + eye(v);