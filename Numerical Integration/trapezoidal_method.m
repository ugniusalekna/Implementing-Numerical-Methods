function [I, h] = trapezoidal_method(f, a, b, N)

% function trapezoidal_method returns two values: 
% I - a value of a given function f, integrated from a to b
% h - length of each subinterval [x_i+1, x_i]
% function trapezoidal_method has 4 input values, being:
% f - the function, that you are willing to integrate,
% a and b - starting and ending points of an interval
% N - the amount of subintervals [x_i+1, x_i]

x1 = a;
I = 0;
h = (b - a)/N;
for i = 1:N
    x2 = x1 + h;
    I = I + h*(feval(f, x1) + feval(f, x2))/2;
    x1 = x2;
end