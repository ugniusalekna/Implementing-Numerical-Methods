function [x, y] = function_evaluation(a, b, n)

h = (b - a)/n;
x(1) = a;
x(n+1) = b;
y(1) = given_function(x(1));
y(n+1) = given_function(x(n+1));

for i = 2:n
   x(i) = x(i-1) + h;
   y(i) = given_function(x(i));
end