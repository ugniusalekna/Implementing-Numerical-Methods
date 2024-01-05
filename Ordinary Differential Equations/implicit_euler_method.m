% function implicit_euler_method takes 4 values as an input:
% f is the given function: dy/dt = f
% a and b are the beginning and the end of a given interval
% h is the size of a step
% function returns two arrays, t and Y, which are the t values and
% corresponding solutions to the differential equation

function [t, Y] = implicit_euler_method (f, a, b, h)

n = (b - a)/h;

% Setting the initial values
Y(1) = 0;
t(1) = a;

% The method is implicit, so we must use any iterative method to find the
% solution
% Using the Implicit Euler Method algorithm with Newton Method
for i = 2 : n + 1
    t(i) = t(i-1) + h;
    fx = @(YY) Y(i-1) + h*feval(f, t(i), YY) - YY;
    Y(i) = newton_method(fx, 0.01, 100, 1.e-9);
end