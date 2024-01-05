clear; clc;

% 1 Dalis. Tiesiniu lygciu sprendimas iteraciniais metodais

% A = coefficient_matrix(1, 1.34, 0.2, -0.59, 0.43, 0.01);
% b = [1.94 -0.23 -1.94 0.23];
% X = [0 0 0 0];

% a) ----- Jakobio metodas -----------------

%J1 = jacobi_method(A, b, X, 1.e-4)';
%J2 = jacobi_method(A, b, X, 1.e-8)';

% b) ----- Zeidelio metodas ----------------

%S1 = seidel_method(A, b, X, 1.e-4)';
%S2 = seidel_method(A, b, X, 1.e-8)';

% c) ----- Jungtiniu gradientu metodas -----

%C1 = conjugate_gradient_method(A, b, X, 1.e-4);
%C2 = conjugate_gradient_method(A, b, X, 1.e-8);

% 2 Dalis. Tikriniu reiksmiu ir tikriniu vektoriu radimas

A = coefficient_matrix(3, 2.34, 2, 0, 0, 0.3);
X = [1 0 0 0];

[x_max, l_max] = power_method(A, X, 1.e-4);
[x_min, m_max] = power_method(inv(A), X, 1.e-4);
l_min = 1/m_max;

polyA = poly(A);
max_eigenA = max(roots(polyA));
min_eigenA = min(roots(polyA));

t = linspace(-1, 7);
plot(t, polyval(polyA, t))
grid on
