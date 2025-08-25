%% Question 1
clear all;
clc;
fprintf("\nQuestion 1\n");

L = 5;
P = 1;
RA = 0.5;
RB = 0.2;
h = L/2;
x = [0, h, L];

y0 = 0;
z0 = 0;

I = @(x) (pi/4) * (RA - (RA - RB)/L * x).^4;

n = length(x)
yeuler = zeros(1, n);
zeuler = zeros(1, n);
yeuler(1) = y0;
zeuler(1) = z0;

for i = 1:n - 1
    xcurr = x(i);
    ycurr = yeuler(i);
    zcurr = zeuler(i);

    f1 =
end

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
