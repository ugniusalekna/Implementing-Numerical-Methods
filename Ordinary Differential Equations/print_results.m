% function print_results takes 5 values as an input:
% a and b are the beginning and the end of a given interval
% h is the size of a step
% method is the name of a method, whose results we want to print
% p is the order of precision of the given method

function print_results (a, b, h, method, p)

n = (b - a)/h;

% converting the string to a function name
method = str2func(method);

[t, Y] = method('given_function', a, b, h);

% printing the values of the function y(t) at each time step t
for i = 1:n + 1
    fprintf('\tn = %d, \tt = %f, \tY = %g\n', i-1, t(i), Y(i));
end

% plotting the function over the interval [a, b]
figure
plot(t, Y, "-o")
title('Kosi uzdavinio sprendinys y(t)')
xlabel('t')
ylabel('y(t)')
grid ON

% calculating the Runge Error 
fprintf("\n\tRunges paklaida laiko momentu t = %f\n\n", b);

% k is the number of times h is going to be divided by 2
k = 10;
% temp is a temporary value that changes during each cycle;
% it holds the last value of y(t) with h = h/2^(i-1)
temp = Y(n+1);
% t_temp is a temporary value that changes during each cycle;
% it holds the last value of the Runge Error's ratio
t_temp = 0;

fprintf('\tY = %f, kai h = %f\n', Y(n+1), h);
for i = 1:k

    % calculating the value of y(t) at t = b with h = h/2^i
    [~, YY] = method('given_function', a, b, h/(2^i));
    Y_h(i) = YY(n*2^(i) + 1);

    % calculating the Runge Error by the formula
    R_err = abs(Y_h(i) - temp)/(2^p - 1);
    temp = Y_h(i);

    % calculating the ratio of the current and the last Runge Error
    t_eil = t_temp/R_err;
    t_temp = R_err;
    fprintf('\tY = %f, kai h = %f \tRunges paklaida = %0.15f \tPaklaidu santykis = %f\n', Y_h(i), h/2^i, R_err, t_eil);
end

% printing the order of precision
fprintf('\n\tTikslumo eile yra: %f', log2(t_eil));