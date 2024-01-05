function lotka_volterra_model()
clear; clc;

% initial amounts of prey and predators alive
y0 = [1000; 100];
% setting the time interval [t0; T] and the timestep h
t0 = 0;
T = 50;
h = 0.005;

% Solving the problem with Explicit Euler Method
[t_Euler, Y_Euler] = explicit_euler_method('lotka_volterra_functions', y0, t0, T, h);

% Solving the problem with MatLab solver ode45
tspan = t0:h:T;
[t_ode45, Y_ode45] = ode45('lotka_volterra_functions', tspan, y0);

% Plotting Explicit Euler Method and ode45 side by side
subplot(2,1,1);
plot(t_Euler, Y_Euler(1,:), t_Euler, Y_Euler(2,:));
xlabel("Time");
ylabel("Explicit Euler Method");

subplot(2,1,2);
plot(t_ode45, Y_ode45(:,1), t_ode45, Y_ode45(:,2));
xlabel("Time");
ylabel("ode45");

% Plotting Prey and Predator values (integral curves of y1(t) and y2(t))
figure
hold on
plot(t_Euler, Y_Euler(1,:));
plot(t_Euler, Y_Euler(2,:));
title('Lotka Volterra Model')
xlabel('Time')
ylabel('Amount Alive')
legend('Prey', 'Predators');
grid on
hold off;

% Plotting t x y1(t) x y2(t) 3D plot (phase lines)
figure
plot3(t_Euler, Y_Euler(1,:), Y_Euler(2,:));
xlabel("Time");
ylabel("Prey");
zlabel("Predators");

end