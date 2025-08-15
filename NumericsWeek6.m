%% Week 6
clear all
%% Question 1
% Runge-Kutta Method
fprintf("Question 1\n");

f = @(x, y) 1.2*x^3+0.18*x^8-2*y^2;

x0 = 0.5;
y0 = 0.0188;
h = 0.2;

a1 = 0.5;
a2 = a1;
p1 = 1;
q11 = p1;


while x0 <= 1.3
    fprintf("x: %.4f y: %.4f\n", x0, y0);
    k1 = f(x0, y0);
    k2 = f(x0 + p1 * h, y0 + q11 * k1 * h);
    y0 = y0 + (0.5 * k1 + 0.5 * k2) * h;
    x0 = x0 + h;
end

%% Question 2
fprintf("Question 2\n");

f = @(x, y) 4.8*x^5+1.92*x^12-3*y^2;

x0 = 0.75;
y0 = 0.1424;
h = 0.1;
a1 = 0;
a2 = 1;
p1 = 0.5;
q11 = 0.5;

while x0 <= 1.2
    fprintf("x: %.4f y: %.4f\n", x0, y0);
    k1 = f(x0, y0);
    k2 = f(x0 + p1 * h, y0 + q11 * k1 * h);
    y0 = y0 + (a1 * k1 + a2 * k2) * h;
    x0 = x0 + h;
end

%% Question 3
fprintf("Question 3\n");

f = @(x, y) 2.3*(1+y^2)^0.5;

x0 = 0.0;
y0 = 0.0;
h = 0.05;
a1 = 1/3;
a2 = 2/3;
p1 = 0.75;
q11 = p1;

while x0 <= 1.2
    fprintf("x: %.4f y: %.4f\n", x0, y0);
    k1 = f(x0, y0);
    k2 = f(x0 + p1 * h, y0 + q11 * k1 * h);
    y0 = y0 + (a1 * k1 + a2 * k2) * h;
    x0 = x0 + h;
end
