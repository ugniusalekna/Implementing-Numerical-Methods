function A = coefficient_matrix(k, s, t, u, v, c)

n = 4;

S = (s*ones(1, n));
T = (t*ones(1, n-1));
U = (u*ones(1, n-2));
V = (v*ones(1, n-3));

D = diag(S) + diag(T, 1) + diag(T, -1) + diag(U, 2) + diag(U, -2) + diag(V, 3) + diag(V, -3);

C = diag(c*ones(1, n));

A = D + k*C;