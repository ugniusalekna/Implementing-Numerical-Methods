% % Vector Y is a vector of the unknown functions y1, ... , ym
% % Vector f is the right hand side of the system of equations
% % dy(i)/dt = f(i)

function f = van_der_pol_functions(t, Y)
    f = zeros(2,1);
    mu = 1;
    f(1) = Y(2);
    f(2) = mu.*(1 - Y(1).^2).*Y(2) - Y(1);
end