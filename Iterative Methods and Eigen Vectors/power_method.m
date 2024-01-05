function [X, L] = power_method(A, X, atol)

% function power_method returns two values, being:
% L - max eigenvalue of linear system of equations AX = LX 
% X - eigenvector, corresponding to the max eigenvalue L
% function power_method has 3 input values, being:
% A - the coefficient matrix
% X - the starting vector of the algorithm, which has a norm of 1
% atol - maximum error of the root

X = (X/norm(X))';
err = inf;
while err > atol
    Y = A*X;
    L = Y'*X;
    P = Y / norm(Y);
    err = norm(P - X);
    X = P;
end