% function explicit_euler_method takes 4 values as an input:
% f is the given function: dy/dt = f
% a and b are the beginning and the end of a given interval
% h is the size of a step
% function returns two arrays, t and Y, which are the t values and
% corresponding solutions to the differential equation

function [t, Y] = explicit_euler_method (f, a, b, h)

n = (b - a)/h;

% Setting the initial values
Y(1) = 0;
t(1) = a;

% Using the Explicit Euler Method algorithm
for i = 2 : n + 1
    Y(i) = Y(i-1) + h*feval(f, t(i-1), Y(i-1));
    t(i) = t(i-1) + h;
end