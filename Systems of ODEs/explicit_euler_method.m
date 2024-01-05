% function explicit_euler_method takes 5 values as an input:
% f is the right side of the system of equations dy(i)/dt = f(i)
% y0 are the initial values of the variables y1, ... , ym at t = t0
% t0 and T are the beginning and the end of a given interval
% h is the size of a step
% function returns an array and a matrix, t and Y, which are the time values and
% corresponding solutions to the system of differential equations

function [t, Y] = explicit_euler_method(f, y0, t0, T, h)
    
    % calculating the amount of steps in the interval [t0, T]
    n = floor((T - t0)/h);
    
    % generating a time vector t and presetting the Y values with
    % zeros
    t = t0:h:T;
    Y = zeros(length(y0), n+1);
    % YY is a temporary vector to hold the Y values at time t(i)
    YY = zeros(length(y0), 1);

    % setting the initial values
    for i = 1:length(y0)
        Y(i,1) = y0(i);
    end
    
    % using the explicit eulers method, altered for matrices
    for i = 2:n+1

        for j = 1:length(y0)
            YY(j) = Y(j, i-1);
        end
        for j = 1:length(y0)
            G = feval(f, t(j), YY);
            Y(j, i) = Y(j, i-1) + h*G(j);
        end
    end
end