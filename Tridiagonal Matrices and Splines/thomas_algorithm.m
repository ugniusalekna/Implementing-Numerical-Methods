function x = thomas_algorithm(a, b, c, d)

% function thomas_algorithm returns one vector x
% which is a solution to a linear tridiagonal system of equations
% function thomas_algorithm has 4 input values, being:
% a - the lower diagonal vector of a matrix
% b - the middle diagonal vector of a matrix
% c - the upper diagonal vector of a matrix
% d - the right hand side vector

n = length(b);

% Checking whether the algorithm fulfills the convergence test
% Firstly we check if every inequality holds true
temp = 0;
for i = 1:n
    if abs(b(i)) >= abs(a(i)) + abs(c(i))
        temp = temp + 1;
    end
end
% Then, if the latter proposition is true, we check if at least one strong
% inequality holds true with a while loop
if temp == n
    j = 1;
    while j <= n
        if abs(b(j)) > abs(a(j)) + abs(c(j))
            break
        else
            if j == n
                x = NaN;
                fprintf("There was no inequality\n|b(i)| > |a(i)| + |c(i)|\nthat had been fulfilled");
                return
            end
        end
        j = j + 1;
    end
else
    x = NaN;
    fprintf("There was at least one inequality\n|b(i)| >= |a(i)| + |c(i)|\nnot fulfilled\n");
    return
end

C(1) = -c(1)/b(1);
D(1) = d(1)/b(1);

% Forward elimination
for i = 2:n-1
    V(i) = a(i)*C(i-1) + b(i); % Common denominator
    C(i) = -c(i)/V(i);
    D(i) = (d(i) - a(i)*D(i-1))/V(i);
end
D(n) = (d(n) - a(n)*D(n-1))/(a(n)*C(n-1) + b(n));
x(n) = D(n);

% Back substitution to solve for x
for i = n-1:-1:1
    x(i) = C(i)*x(i+1) + D(i);
end

% Printing the results
%for i = 1:n
    %fprintf('%f\n', x(i));
%end