function [e, G, H] = cubic_spline_interpolation(x, y)

% function cubic_spline_interpolation returns three vectors: e, G and H
% which are the coefficients of the interpolation functions S(i)
% function cubic_spline_interpolation has 2 input values, being:
% x - an array (a vector) of x values
% y - an array (a vector) of y values (at point x(i))

n = length(x) - 1;

% Counting each interval lenght
for i = 1:n
    h(i) = x(i+1) - x(i);
end

% Setting the additional values for each vector so the tridiagonal matrix
% can be formed
% U is the upper diagonal vector of a matrix
% M is the middle diagonal vector of a matrix
% L is the lower diagonal vector of a matrix
% F is the right hand side vector
M(1) = 1; M(n+1) = 1;
U(1) = 0; U(n+1) = 0;
L(1) = 0; L(n+1) = 0;
F(1) = 0; F(n+1) = 0;

for i = 2:n
    H(i) = h(i-1) + h(i); % Common denominator
    M(i) = 2;
    U(i) = h(i)/H(i);
    L(i) = h(i-1)/H(i);
    F(i) = 6*(((y(i+1) - y(i))/h(i) - (y(i) - y(i-1))/h(i-1))/H(i));
end

% Solving the linear system with thomas_algorithm function for a vector g
g = thomas_algorithm(L, M, U, F);

% Solving for the coefficients of each cubic interpolation function
for i = 1:n
    e(i) = (y(i+1) - y(i))/h(i) - g(i+1)*h(i)/6 - g(i)*h(i)/3;
    G(i) = g(i)/2;
    H(i) = (g(i+1) - g(i))/(6*h(i));
end

% Printing the results
%for i = 1:n
    %fprintf('\tn = %d, \te = %f, \tg = %f, \th = %f\n',i, e(i), G(i), H(i));
    %fprintf('S(%d) = %f + %f(x - %f) + %f(x - %f)^2 + %f(x - %f)^3\n', i, y(i), e(i), x(i), G(i), x(i), H(i), x(i));
%end