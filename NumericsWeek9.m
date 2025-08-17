%% Week 9
clear all
%% Question 1
% MATLAB code to solve the temperature distribution problem using finite-difference method

clear;
clc;

% Parameters
L = 0.3;  % Size of the plate in m
h = L / 3;  % Grid spacing, since 3 intervals
const = 2.6;  % Constant in Poisson's equation

% Coordinates
x = 0:h:L;
y = 0:h:L;

% Boundary temperatures
T_left = 5;
T_right = 60;
T_bottom = 50;
T_top = 105;

% Compute RHS full for each inner node
rhs11 = const * x(2)^2 * y(2)^3 * h^2;  % For (1,1), indices 2 in MATLAB (1-based)
rhs21 = const * x(3)^2 * y(2)^3 * h^2;  % (2,1)
rhs12 = const * x(2)^2 * y(3)^3 * h^2;  % (1,2)
rhs22 = const * x(3)^2 * y(3)^3 * h^2;  % (2,2)

% Known sums for each equation
known11 = T_left + T_bottom;
known21 = T_right + T_bottom;
known12 = T_left + T_top;
known22 = T_right + T_top;

% Right-hand sides for the system
b = [rhs11 - known11;
     rhs21 - known21;
     rhs12 - known12;
     rhs22 - known22];

% Coefficient matrix A
A = [-4, 1, 1, 0;
     1, -4, 0, 1;
     1, 0, -4, 1;
     0, 1, 1, -4];

% Solve for temperatures: v = [T11; T21; T12; T22]
v = A \ b;
T11 = v(1);
T21 = v(2);
T12 = v(3);
T22 = v(4);

% Compute heat fluxes
% ∂T/∂x at (0,2) using forward difference O(h^2)
dTdx_02 = (-3 * T_left + 4 * T12 - T22) / (2 * h);

% ∂T/∂y at (1,3) using backward difference O(h^2)
dTdy_13 = (3 * T_top - 4 * T12 + T11) / (2 * h);

% Print answers for each question part
fprintf('\n');
fprintf('[1 mark] Enter h = Δx = Δy = %.4f m.\n', h);

fprintf('[1 mark] The coordinates of node (2,1) are given by x_2 = %.4f m, y_1 = %.4f m.\n', x(3), y(2));

fprintf('[3 marks] Enter temperature at the following nodes:\n');
fprintf('T_{2,0} = %.4f\n', T_bottom);
fprintf('T_{1,3} = %.4f\n', T_top);
fprintf('T_{0,2} = %.4f\n', T_left);
fprintf('T_{3,1} = %.4f\n', T_right);

fprintf('[5 marks] Using centered finite-difference formulas of order O(h^2), the equations at inner nodes are:\n');
fprintf('-4 T_{1,1} + 1 T_{2,1} + 1 T_{1,2} + 0 T_{2,2} = %.4f\n', b(1));
fprintf('1 T_{1,1} -4 T_{2,1} + 0 T_{1,2} + 1 T_{2,2} = %.4f\n', b(2));
fprintf('1 T_{1,1} + 0 T_{2,1} -4 T_{1,2} + 1 T_{2,2} = %.4f\n', b(3));
fprintf('0 T_{1,1} + 1 T_{2,1} + 1 T_{1,2} -4 T_{2,2} = %.4f\n', b(4));

fprintf('[5 marks] Solve the equation for T_{1,1}, T_{2,1}, T_{1,2}, T_{2,2} and enter the answers:\n');
fprintf('T_{1,1} = %.4f\n', T11);
fprintf('T_{2,1} = %.4f\n', T21);
fprintf('T_{1,2} = %.4f\n', T12);
fprintf('T_{2,2} = %.4f\n', T22);

fprintf('[5 marks] The heat flux at boundary nodes:\n');
fprintf('at node (0,2): ∂T/∂x = %.4f\n', dTdx_02);
fprintf('at node (1,3): ∂T/∂y = %.4f\n', dTdy_13);
