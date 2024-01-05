function R = jacobi_method(A, b, X, atol)

% function jacobi_method returns one vector R
% which is a solution to a linear system of equations AX = b
% function jacobi_method has 4 input values, being:
% A - the coefficient matrix
% b - the right hand side vector
% X - the starting vector of the algorithm
% atol - maximum error of the root

n = length(b);
b = b';

% Checking if the matrix A is diagonally dominant (A convergence test)
for i = 1:n
    row = abs(A(i,:));
    dif = sum(row) - row(i);
    if row(i) <= dif
        fprintf("Given matrix A is not diagonally dominant, Jacobi's method will fail to converge.")
        R = NaN;
        return
    end
end

err = inf;
k = 0;
while err > atol
    k = k + 1;
    for i = 1:n
        Sum = 0;
        for j = 1:n
            if i ~= j
                Sum = Sum + A(i,j)*X(j);
            end
        end
        R(i) = 1/A(i,i) * (b(i) - Sum);
    end
    err = max(abs(X - R));
    fprintf('x(%d) = %s; error = %s ; loss = %f\n',k, sprintf('%f ', R), sprintf('%f ', abs(X - R)), err);
    X = R;
end