%% Question 1
clear all;
clc;
fprintf("\nQuestion 1\n");

L = 4;
w0 = 3.8;
EI = 10^3;
f = @(x) (1/EI)*((-w0/(6*L)*(x^3)) + ((w0*L)/6)*x);
a = zeros(3);

for i = 1:3
    a(i) = f(i);
    fprintf("%.8f\n", a(i));
end

M = [
    -2 1 0
    1 -2 1
    0 1 -2
    ];

v = M \ a;

fprintf("\n");
for i = 1:length(v)
    fprintf("v%d %.4f\n", i, v(i));
end

v0 = 0;
v4 = 0;

h = 1;
theta0 = (-v(2) + 4*v(1) - 3*v0) / (2*h);
fprintf("\nx0:theta %.8f\n", theta0);
theta2 = (-v4 + 8*v(3) - 8*v(1) + v0) / (12*h);
fprintf("x2:theta %.8f\n", theta2);

fprintf("\n2 Reduce h\n");

%% Question 2
clear all;
fprintf("\nQuestion 2\n");

k = 0.68;
L = 3;
dx = 1;
dt = 0.1;
lambda = k * dt / dx^2;

x = 0:dx:L;
nx = length(x);

T = zeros(nx, 1);
for i = 1:nx
    T(i) = 25 + 55*sin(pi * x(i)/6);
end

T(1) = 25;
T(end) = 80;

steps = 2;
T_old = zeros(nx, steps + 1);
T_old(:, 1) = T;

for step = 1:steps
    T_new = T;
    for i = 2:nx - 1
        T_new(i) = T(i) + lambda * (T(i+1) -2*T(i) + T(i-1));
    end
    T = T_new;
    T_old(:, step+1) = T;
end

T_old

T2 = T_old(:, 3);
f = T2.^2;
h = dx;
I = (3 * h / 8) * (f(1) + 3 * f(2) + 3 * f(3) + f(4));

E = (1 / 2) * I;
fprintf('\nThermal energy: %.4f\n', E);
