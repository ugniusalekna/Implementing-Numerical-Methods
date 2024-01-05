function van_der_pol_oscillator()
clear; clc;

% Setting the initial values of y(t) and y'(t) at t = t0
y0 = [1; 0];

% Setting the time interval [t0; T] and timestep h
% For mu = 1:
t0 = 0;
T = 30;
h = 0.025;
% For mu = 100:
% t0 = 0;
% T = 350;
% h = 0.004; % 150 sec.


% Solving the problem with Explicit Euler and Four Step Runge Kutta methods
[t_RK4, Y_RK4] = four_step_runge_kutta_method('van_der_pol_functions', y0, t0, T, h);
[t_Euler, Y_Euler] = explicit_euler_method('van_der_pol_functions', y0, t0, T, h);

% Solving the problem with MatLab solvers ode45 and ode15s
tspan = t0:h:T;
[t_ode45, Y_ode45] = ode45('van_der_pol_functions', tspan, y0);
[t_ode15s, Y_ode15s] = ode15s('van_der_pol_functions', tspan, y0);

% Plotting all 4 methods side by side
figure
subplot(4,1,1);
plot(t_RK4, Y_RK4(1,:));
xlabel("Time");
ylabel("RK4");

subplot(4,1,2);
plot(t_Euler, Y_Euler(1,:));
xlabel("Time");
ylabel("Euler");

subplot(4,1,3);
plot(t_ode45, Y_ode45(:,1));
xlabel("Time");
ylabel("ode45");

subplot(4,1,4);
plot(t_ode15s, Y_ode15s(:,1));
xlabel("Time");
ylabel("ode15s");

% Plotting the position and velocity values (integral curves of y(t) and y'(t)) 
figure
hold on
plot(t_RK4, Y_RK4(1,:));
plot(t_RK4, Y_RK4(2,:)); % <-- comment out this for mu = 100
title('Van Der Pol Oscillator Model')
xlabel('Time')
ylabel('Position & Velocity')
grid on
legend('y(t)', 'y`(t)') % <-- comment out this for mu = 100
hold off;

% Plotting t x y(t) x y'(t) 3D plot (phase lines)
figure
plot3(t_RK4, Y_RK4(1,:), Y_RK4(2,:));
xlabel("Time");
ylabel("Position");
zlabel("Velocity");

end