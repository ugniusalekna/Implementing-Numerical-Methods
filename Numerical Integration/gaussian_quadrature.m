function [I, h] = gaussian_quadrature(f, a, b, m)

% function gaussian_quadrature returns two values: 
% I - a value of a given function f, integrated from a to b
% h - length of each subinterval [x_i+1, x_i]
% function gaussian_quadrature has 3 input values, being:
% f - the function, that you are willing to integrate,
% a and b - starting and ending points of an interval
% the amount of points the interval [x_i+1, x_i] is divided

c = 1;
w = 0;

h = (b-a)/m;
x0 = a;
I = 0;
for i = 1:m
    x1 = x0 + h;
    I = I + c*(x1 - x0)*feval(f, (w*(x1 - x0)/2 + (x0 + x1)/2));
    x0 = x1;
end
