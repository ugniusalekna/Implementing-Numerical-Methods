% function three_step_runge_kutta_method takes 4 values as an input:
% f is the given function: dy/dt = f
% a and b are the beginning and the end of a given interval
% h is the size of a step
% function returns two arrays, t and Y, which are the t values and
% corresponding solutions to the differential equation

% function [t, Y] = three_step_runge_kutta_method(f, a, b, h)
% 
% n = (b - a)/h;
% 
% % Setting the initial values
% t(1) = a;
% Y(1) = 0;
% 
% % Using the Three Step Runge Kutta Method algorithm
% for i = 1:n
%     t(i+1) = t(i) + h;
%     k1 = feval(f, t(i), Y(i));
%     k2 = feval(f, t(i) + h/2, Y(i) + h/2*k1);
%     k3 = feval(f, t(i) + h, Y(i) + h*(-k1 + 2*k2));
%     Y(i+1) = Y(i) + h/6*(k1 + 4*k2 + k3);
% end

function [t, Y] = three_step_runge_kutta_method(f, y0, t0, T, h)
    
    % calculating the amount of steps in the interval [t0, T]
    n = floor((T - t0)/h);
    
    % generating a time vector t and presetting the result values Y with
    % zeros
    t = t0:h:T;
    Y = zeros(length(y0), n+1);
    YY = zeros(length(y0), 1);

    % setting the initial values
    for i = 1:length(y0)
        Y(i,1) = y0(i);
    end
    
    % using the altered explicit eulers method for matrices
    for i = 2:n+1

        for j = 1:length(y0)
            YY(j) = Y(j, i-1);
        end
        for j = 1:length(y0)
            G = feval(f, t, YY);
            Y(j, i) = Y(j, i-1) + h*G(j);
        end
    end

    for i = 2:n+1
%         t(i) = t(i-1) + h;
%         k1 = feval(f, t(i-1), Y(i-1));
%         k2 = feval(f, t(i-1) + h/2, Y(i-1) + h/2*k1);
%         k3 = feval(f, t(i-1) + h, Y(i-1) + h*(-k1 + 2*k2));
%         Y(i) = Y(i-1) + h/6*(k1 + 4*k2 + k3);

        for j = 1:length(y0)
            YY(j) = Y(j, i-1);
        end
%         for j = 1:length(y0)
%             G = feval(f, t(j), YY);
%             k1 = 
%             Y(j, i) = Y(j, i-1) + h*G(j);
%             Y(j, i) = Y(j, i-1) + h/6*(k1 + 4*k2 + k3);
%         end
    end
end