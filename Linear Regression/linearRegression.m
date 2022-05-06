function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

%Zachary Nall 4/26/2022

%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

% Start of my work
% sorting and eliminating outliers
format long
if size(x) ~= size(y)
    error('X and Y matricies are not the same size')
end

isx = issorted(x);
isy = issorted(y);

if isx ~= 1 | isy ~= 1
    [sortedY, sortOrder] = sort(y);
    sortedX = x(sortOrder);
    fX = sortedX;
    fY = sortedY;
else
    fX = x;
    fY = y;
end

c = length(fX);

Q1i = floor((c+1)/4);
Q3i = floor((3*c+3)/4);
Q1 = fY(Q1i);
Q3 = fY(Q3i);
IQR = Q3-Q1;


[U,Z]=size(fX);

for i = Z:-1:1
    if fY(1,i) < (Q1-(1.5*IQR)) | fY(1,i) > (Q3+(1.5*IQR))
        fY(:,i) = [];
        fX(:,i) = [];
    end
end


% Linear Regression
sY = sum(fY);
sX = sum(fX);
sY2 = sum(fY.^2);
sYX = sum(fY.*fX);
sX2 = sum(fX.^2);
n = length(fX);
mY = (sum(fY)/n);
mX = (sum(fX)/n);

a1 = (n*sYX-sY*sX)/(n*sX2-sX^2);
a0 = mY-a1*mX;

input = a0+a1*fX;

slope = a1;
intercept = a0;

SStot = sum((fY-mY).^2);
SSres = sum((fY-input).^2);
Rsquared = 1-(SSres/SStot)

end
