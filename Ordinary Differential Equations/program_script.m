clear; clc;

% Isspresti Kosi uzdavini intervale [0, 1] taikant metodus:

a = 0;
b = 1;
h = 0.125;
n = (b - a)/h;

% ----------------------------------------
% ----- Isreikstinis Eulerio metodas -----
% ----------------------------------------

% p = 1;
% print_results(a, b, h, 'explicit_euler_method', p);

% ------------------------------------------
% ----- Neisreikstinis Eulerio metodas -----
% ------------------------------------------

% p = 1;
% print_results(a, b, h, 'implicit_euler_method', p);

% --------------------------------------
% ----- Simetrinis Eulerio metodas -----
% --------------------------------------

% p = 2;
% print_results(a, b, h, 'semi_implicit_euler_method', p);

% ----------------------------------------------
% ----- Tripakopis Runges ir Kutos metodas -----
% ----------------------------------------------

% p = 3;
% print_results(a, b, h, 'three_step_runge_kutta_method', p);

% ---------------------------------------------------
% ----- Trizingsnis Isreikstinis Adamso metodas -----
% ---------------------------------------------------
 
%  p = 3;
%  print_results(a, b, h, 'three_step_adams_bashforth_method', p);

% -----------------------------------
% ----- Dvizingsnis BDF metodas -----
% -----------------------------------

% p = 2;
% print_results(a, b, h, 'two_step_bdf_method', p);