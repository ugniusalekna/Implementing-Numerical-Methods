clear; clc;

% Apskaiciuoti apibreztini integrala Trapecijos ir Gauso 1 eiles metodais

a = 1;
b = 4;
N = 2^5;
k = 10;

% -------- Trapecijos metodas ---------

p = 2; % formules tikslumo eile

[I(1), h(1)] = trapezoidal_method('given_function', a, b, 2);

fprintf('-------- Trapecijos metodas ---------\n\n');
for i = 2:k
    [I(i), h(i)] = trapezoidal_method('given_function', a, b, 2^i);
    R(i) = abs(I(i) - I(i-1))/(2^p - 1);
    fprintf('N = %d,  h = %f,  I = %f, R = %f\n', 2^i, h(i), I(i), R(i));
end

% ------- Gauso 1 eiles metodas -------

[G(1), hh(1)] = gaussian_quadrature('given_function', a, b, 2);

fprintf('\n------- Gauso 1 eiles metodas -------\n\n');
for i = 2:k
    [G(i), hh(i)] = gaussian_quadrature('given_function', a, b, 2^i);
    R(i) = abs(G(i) - G(i-1))/(2^p - 1);

    fprintf('N = %d, h = %f, I = %f, R = %f\n', 2^i, hh(i), G(i), R(i));
end