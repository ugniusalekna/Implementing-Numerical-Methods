function program_script
format longG

clear; clc;

% Pirmoji uzduotis. Triistrizaines lygciu sistemos sprendimas

% a = [0, 1/2, 1/2, 1/2];
% b = [2, 2, 2, 2];
% c = [1/2, 1/2, 1/2, 0];
% d = [3, 6, 9, 9.5];
% thomas_algorithm(a, b, c, d)'

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

% Antroji uzduotis.

% a) Kubinio splaino radimas intervale, zinant funkcija f(x) =
% given_function(x)

a = 2;
b = 5;
n = 10;

[X, Y] = function_evaluation(a, b, n);

[e, G, H] = cubic_spline_interpolation(X, Y);

%p = 3.5;
%function_approximation(p, X, Y)

grid on;

%fplot(@given_function, [a, b])
%hold on

% plot(X, Y, 'o')
% hold on
% for i=1:n
%     fplot(@(t) Y(i) + e(i)*(t - X(i)) + G(i)*(t - X(i)).^2 + H(i)*(t - X(i)).^3, [X(i) X(i+1)])
%     hold on
% end
% hold on

% Uzdavinio sprendimas panaudojant MATLAB kubinio splaino funkcija spline
%XX = a:(b-a)/n:b;
%YY = spline(X, Y, XX);
%plot(X, Y, 'o', XX, YY);
x = [ 0 1 2 3];
y = [ 0 0.5 2 1.5];
pp = csape(x, y, 'v');
pp.coefs
%hold off

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

% b) Kubinio splaino radimas aproksimuojant funkcija, kuri uzduota reiksmiu
% lentele

% x = [0, 1, 2, 3, 4, 5];
% y = [0, 0, 0, 0, 0, 209];
% 
% [e, G, H] = cubic_spline_interpolation(x, y);
% 
% function_approximation(4.9, x, y)
% 
% grid on;
% plot(x, y, 'o')
% hold on
% for i=1:length(x) - 1
%     fplot(@(t) y(i) + e(i)*(t - x(i)) + G(i)*(t - x(i)).^2 + H(i)*(t - x(i)).^3, [x(i) x(i+1)])
%     hold on
% end
% hold off