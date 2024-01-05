% function two_step_bdf_method takes 4 values as an input:
% f is the given function: dy/dt = f
% a and b are the beginning and the end of a given interval
% h is the size of a step
% function returns two arrays, t and Y, which are the t values and
% corresponding solutions to the differential equation

function [t, Y] = two_step_bdf_method(f, a, b, h)

n = (b - a)/h;

% Setting the initial values
t(1) = a;
Y(1) = 0;

% Two Step BDF Method is 2nd order and Explicit Euler Method is 1st order
% so the difference is no bigger than 1, that means we can use
% Explicit Euler Method to find Y(1),..,Y(m-1)
for i=1:2
    Y(i+1) = Y(i) + h*feval(f, t(i), Y(i));
    t(i+1) = t(i) + h;
end

% The method is implicit, so we must use any iterative method to find the
% solution
% Using the Two Step BDF Method algorithm with Newton Method
for i=3:n
    t(i+1) = t(i) + h;
    func = @(YY) 4/3*Y(i) - 1/3*Y(i-1) + h*2/3*feval(f, t(i+1), YY) - YY;
    Y(i+1) = newton_method(func, 0.01, 100, 1.e-9);
end