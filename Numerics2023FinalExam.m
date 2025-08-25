%% Question 1
clear all;
clc;
fprintf("\nQuestion 1\n");

L = 5;
P = 1e3;
RA = 0.5;
RB = 0.2;
h = L/2;
x = [0, h, L];
E = 10^7;

y0 = 0;
z0 = 0;

I = @(x) (pi/4) * (RA - ((RA - RB) / L) * x).^4;

n = length(x);
yeuler = zeros(1, n);
zeuler = zeros(1, n);
yeuler(1) = y0;
zeuler(1) = z0;

for i = 1:n - 1
    xcurr = x(i);
    ycurr = yeuler(i);
    zcurr = zeuler(i);

    f1 = zcurr
    f2 = -P * (L - xcurr) / (E * I(xcurr))

    yeuler(i + 1) = ycurr + h * f1;
    zeuler(i + 1) = zcurr + h * f2;
end
yeuler
zeuler
fprintf("\n");

fprintf("Runge-Kutta\n");

h = L / 2;
yRK = zeros(1, n);
zRK = zeros(1, n);
xRK = [0, h, L];

yRK(1) = y0;
zRK(1) = z0;

for i = 1:n - 1
    xcurr = xRK(i);
    zcurr = zRK(i);
    ycurr = yRK(i);

    k11 = zcurr
    k12 = - P*(L - xcurr) / (E * I(xcurr))
    xnext = xcurr + h;
    k21 = zcurr + k12*h
    k22 = - P*(L - xnext) / (E * I(xnext))

    yRK(i + 1) = ycurr + (h / 2) * (k11 + k21);
    zRK(i + 1) = zcurr + (h / 2) * (k12 + k22);
end

yRK
zRK

%% Question 2
clear all;
fprintf("\nQuestion 2\n");

fprintf("Subsitute the formulas into the partial differential equation\n");

A = [-12 5 5 0;
      1 -12 0 5;
      1 0 -12 5;
      0 1 1 -12];

b = [
    88
    372
    -244
    424
    ];

T = A \ b;
T
