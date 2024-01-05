function f = function_approximation(t, x, y)

[e, G, H] = cubic_spline_interpolation(x, y);

for i = 1:length(x)-1
    if t > x(i) && t <= x(i+1)
        f = y(i) + e(i)*(t - x(i)) + G(i)*(t - x(i)).^2 + H(i)*(t - x(i)).^3;
    end
end