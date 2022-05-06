function [I] = Simpsons(x,y)

[m,X] = size(x);
[m,Y] = size(y);
if X ~= Y
    error('Inputs are not the same length.')
end

check = x(1):x(2)-x(1):x(end);
for i = 1:size(x,2)
    if x(i) ~= check(i)
        error('x inputs are not equally spaced.')
    end
end

N=size(x,2);
h=(x(end)-x(1))/(N-1);

sum = y(1);
for i = 2:(X-2)
    if mod(i,2)==0
        sum=sum+4*y(i);
    else
        sum=sum+2*y(i);
    end
end

% trapezoidal rule for last interval
if mod(X,2) == 0
    warning('Trapezoidal rule is used for last interval.')
    sum=sum+y(X-1);
    I = (sum*h/3) + ((y(X)+y(X-1))*h/2);
else
    sum=sum + 4*y(X-1) + y(X);
    I = sum*h/3;
end