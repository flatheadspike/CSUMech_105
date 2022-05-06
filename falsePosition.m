function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
iter = 0;
ea = 100;
xr = xl;

if nargin < 3
    error('Need 3 input perameters')
end

signchange = func(xl) * func(xu);
if signchange > 0
    error('Bounds do not bracket a root')
end
if nargin < 4 || isempty(es)
    es = 0.0001;
    disp('Es is set to 0.0001')
end
if nargin < 5 || isempty(maxit)
    maxit = 50;
    disp('Maxit is set to 200')
end



while (1)
    iter = iter+1;
    xrold = xr;

    xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    ea = abs(((xr-xrold)/xr)*100);
    
    test = func(xr)*func(xl);

    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit
        break
    end


end

root = xr;
fx = func(xr);
end