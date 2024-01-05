function program_script
format longG

grid ON
fplot(@given_function, [-10, 10]);
fplot(@iteration_function, [-10, 10]);

[r1, n1] = bisection_method('given_function', 0, 100, 1.e-9)
%[r2, n2] = newton_method('given_function', 0.01, 100, 1.e-9)
%[r3, n3] = fixed_point_iteration_method('iteration_function', 2, 100, 1.e-9)

fzero(@given_function, 1)