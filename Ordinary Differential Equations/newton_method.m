function r = newton_method(fx, x, n_max, atol)

%This if clause checks whether there are no mistakes in the input:
if (atol < 0) || (n_max <= 0) || (n_max ~= round(n_max))
    disp('The input is not correct! Check the entered values');
    r = NaN;
    return
end

%If there are no mistakes in the input, we start a for loop:
for i = 1:n_max
    dfx = (fx(x + atol) - fx(x))/atol;
    %dfx calculates apporoximate value of the derivative of fx at a fixed 
    % point x by the definition
    if dfx ~= 0
        n = i;
        r = x - fx(x)/dfx;
        err = abs(r - x);

        if abs(r - x) < atol
            %This if clause checks whether r is the root thus breaking
            %earlier than n_max is reached
            break 
        end
    elseif dfx == 0
        disp('Newton method failed to converge. Try picking a different starting value')
        r = NaN;
        return 
    end
    x = r;
end