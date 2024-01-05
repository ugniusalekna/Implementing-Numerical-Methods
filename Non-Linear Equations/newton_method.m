function [r, n] = newton_method(fx, x, n_max, atol)

%function newton_method returns two values: r and n 
% where r is the root of the given_function and n is the number of
%iterations
%function newton_method has 4 input values, being:
% fx - given_function
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
    dfx = (feval(fx, x + atol) - feval(fx, x))/atol;
    %dfx calculates apporoximate value of the derivative of fx at a fixed 
    % point x by the definition
    if dfx ~= 0
        n = i;
        r = x - feval(fx, x)/dfx;
        err = abs(r - x);

        %This function prints n, r and tolerance values while the loop is running
        fprintf('\tn = %d \tr = %0.15f \ttol = %0.15f\n', i, r, err);

        if abs(r - x) < atol
            %This if clause checks whether r is the root thus breaking
            %earlier than n_max is reached
            break 
        end
    elseif dfx == 0
        disp('Newton method failed to converge. Try picking a different starting value')
        r = NaN;
        n = NaN;
        return 
    end
    x = r;
end