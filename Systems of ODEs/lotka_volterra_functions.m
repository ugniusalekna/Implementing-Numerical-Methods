% % Vector Y is a vector of the unknown functions y1, ... , ym
% % Vector f is the right hand side of the system of equations
% % dy(i)/dt = f(i)

function f = lotka_volterra_functions(t, Y)
    params = [0.7, 0.001, 0.9, 0.001];
    a = params(1);
    b = params(2);
    c = params(3);
    d = params(4);

    f = zeros(2,1);
    
    f(1) = a*Y(1) - b*Y(1)*Y(2);
    f(2) = -c*Y(2) + d*Y(1)*Y(2);
end