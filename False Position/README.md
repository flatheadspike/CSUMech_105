# False Position

Inputs:
* func - the function being evaluated
* Xl - the lower guess
* Xu - the upper guess
* es - the desired relative error (should default to 0.0001%)
* maxit - the maximum number of iterations to use (should default to 200)
* varargin, . . . - any additional parameters used by the function

Outputs:
* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - how many iterations were performed

This program will estimate the root of a function using false position. 

