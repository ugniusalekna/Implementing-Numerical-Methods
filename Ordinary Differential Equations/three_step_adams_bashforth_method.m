% function three_step_adams_bashforth_method takes 4 values as an input:
% f is the given function: dy/dt = f
% a and b are the beginning and the end of a given interval
% h is the size of a step
% function returns two arrays, t and Y, which are the t values and
% corresponding solutions to the differential equation

function [t, Y] = three_step_adams_bashforth_method(f, a, b, h)

n = (b - a)/h;

% Setting the initial values
t(1) = a;
Y(1) = 0;

% Three Step Adams Bashforth Method is 3rd order and Semi Implicit Euler Method is 2nd order
% so the difference is no bigger than 1, that means we can use
% Semi Implicit Euler Method to find Y(1),..,Y(m-1)
for i = 1:2
    t(i+1) = t(i) + h;
    func = @(YY) Y(i) + h/2*(feval(f, t(i), Y(i)) + feval(f, t(i+1), YY)) - YY;
    Y(i+1) = newton_method(func, 0.01, 100, 1.e-9);
    
end

% Using the Three Step Adams Bashforth Method algorithm
for i=3:n
    Y(i+1) = Y(i) + h/12*(23*feval(f, t(i), Y(i)) - 16*feval(f, t(i-1), Y(i-1)) + 5*feval(f, t(i-2), Y(i-2)));
    t(i+1) = t(i) + h;
end