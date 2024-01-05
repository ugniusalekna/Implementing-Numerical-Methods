function [r, n] = fixed_point_iteration_method(gx, x, n_max, atol)

%function fixed_point_iteration_method returns two values: r and n 
% where r is the root of the given_function and n is the number of
%iterations
%function newton_method has 4 input values, being:
% gx - iteration_function
% x - starting value of the algorithm
% n_max - maximum value of iterations, program breaks when reached
% atol - maximum error of the root

%This if clause checks whether there are no mistakes in the input:
if (atol < 0) || (n_max <= 0) || (n_max ~= round(n_max))
    disp('The input is not correct! Check the entered values');
    r = NaN;
    n = NaN;
    return
end

%If there are no mistakes in the input, we start a for loop:
for i = 1:n_max
    
    dgx = (feval(gx, x + atol) - feval(gx, x))/atol;
    %This if clause checks whether the criterion of convergence is
    %fulfilled
    if (abs(dgx) >= 1)
        disp('Fixed point iteration method failed to converge due to criterion not being fulfilled. Try altering the iteration function')
        r = NaN;
        n = NaN;
        break 
    end

    r = feval(gx, x);
    n = i;
    err = abs(r - x);

    %This function prints n, r and tolerance values while the loop is running
    fprintf('\tn = %d \tr = %0.15f \ttol = %0.15f\n', i, r, err);
    
    if abs(r - x) < atol
        %This if clause checks whether r is the root thus breaking
        %earlier than n_max is reached
        break
    end
    x = r;
end