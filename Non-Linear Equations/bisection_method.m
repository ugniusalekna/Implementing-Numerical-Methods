function [r, n] = bisection_method(fx, a, b, atol)

%function bisection_method returns two values: r and n 
% where r is the root of the given_function and n is the number of
%iterations
%function bisection_method has 4 input values, being:
% fx - given_function
% a and b - beginning and end of an interval
% atol - maximum error of the root

% fa and fb are the values of given_function at points a and b
fa = feval(fx, a);
fb = feval(fx, b);

%This if clause checks whether there are no mistakes in the input:
if (a >= b) || (fa*fb > 0) || (atol < 0)
    disp('The input is not correct! Check the entered values');
    r = NaN;
    n = NaN;
    return
end

%If there are no mistakes in the input, we start a while loop:
n = 0;
while abs(b - a) > 2*atol
    n = n + 1;
    r = (a + b)/2;
    fr = feval(fx, r);
    err = min(abs(r-a), abs(r-b));
    
    %This function prints n, r and tolerance values while the loop is running
    fprintf('\tn = %d \tr = %.15f \ttol = %.15f\n', n, r, err);

    if (abs(fr) < atol)
        %This if clause checks whether fr = 0
        return
    else
        if fa * fr < 0
            b = r;
            fb = fr;
        else 
            a = r;
            fa = fr;
        end
    end
end
r = (a + b)/2;