% function four_step_runge_kutta_method takes 5 values as an input:
% f is the right side of the system of equations dy(i)/dt = f(i)
% y0 are the initial values of the variables y1, ... , ym at t = t0;
% t0 and T are the beginning and the end of a given interval
% h is the size of a step
% function returns a vector t and a matrix Y, which are the time values and
% corresponding solutions to the system of differential equations

function [t, Y] = four_step_runge_kutta_method(f, y0, t0, T, h)
    
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
    
    % generating four matrices and presetting the values with zeros
    k1 = zeros(length(y0), n+1);
    k2 = zeros(length(y0), n+1);
    k3 = zeros(length(y0), n+1);
    k4 = zeros(length(y0), n+1);

    % using the four step runge kutta method, altered for matrices
    for i = 1:n
        for j = 1:length(y0)
            YY(j) = Y(j, i);
        end
        k1(:,i) = feval(f, t(i), YY);
        k2(:,i) = feval(f, t(i) + h/2, YY + h/2*k1);
        k3(:,i) = feval(f, t(i) + h/2, YY + h/2*k2);
        k4(:,i) = feval(f, t(i) + h, YY + h*k3);
        for j = 1:length(y0)
            Y(j,i+1) = Y(j,i) + h/6*(k1(j,i) + 2*k2(j,i) + 2*k3(j,i) + k4(j,i));
        end
    end
end