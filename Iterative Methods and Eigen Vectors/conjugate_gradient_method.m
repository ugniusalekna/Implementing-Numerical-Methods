function X = conjugate_gradient_method(A, f, X, atol)

% function conjugate_gradient_method returns one vector R
% which is a solution to a linear system of equations AX = b
% function conjugate_gradient_method has 4 input values, being:
% A - the coefficient matrix
% f - the right hand side vector
% X - the starting vector of the algorithm
% atol - maximum error of the root

A = [2 1 0.95;
    1 2 1;
    0.95 1 2];
f = [3.95 4 3.95];
X = [0 0 0];
atol = 1.e-4;

f = f';
X = X';

P = A*X - f;
Z = P;
k = 0;
while sum(Z.*Z) >= atol^2
    k = k + 1;
    R = A*P;
    t = sum(Z.*P)/sum(R.*P);
    X = X - t*P;
    err = -t*P;
    Z = Z - t*R; %netektis
   
    b = sum(Z.*Z)/sum((Z+t*R).*(Z+t*R));
    P = Z + b.*P;

    fprintf('x(%d) = %s; error = %s ; loss = %f\n', k, sprintf('%f ', X), sprintf('%f ', err), max(Z));
end