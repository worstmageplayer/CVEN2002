%% Week 7
clear all
%% Question 1
% Runge-Kutta Method
fprintf("Question 1\n");

f = @(x, y) 4.7*(1+y^2)^0.5;

x0 = 0.5;
y0 = 5.1951;
h = 0.05;

while x0 <= 0.7
    fprintf("x: %.4f y: %.4f\n", x0, y0);
    k1 = f(x0, y0);
    k2 = f(x0 + 0.5*h, y0 + 0.5*k1*h);
    k3 = f(x0 + h, y0 - k1*h + 2*k2*h);
    y0 = y0 + (1/6)*(k1 + 4*k2 + k3)*h;
    x0 = x0 + h;
end

%% Question 2
fprintf("Question 2\n");

f = @(x, y) x^3/y^7;

x0 = 0.4;
y0 = 0.58;
h = 0.1;

while x0 <= 0.8
    fprintf("x: %.4f y: %.4f\n", x0, y0);
    k1 = f(x0, y0);
    k2 = f(x0 + 0.5*h, y0 + 0.5*k1*h);
    k3 = f(x0 + 0.5*h, y0 + 0.5*k2*h);
    k4 = f(x0 + h, y0 + k3*h);
    y0 = y0 + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h;
    x0 = x0 + h;
end

%% Question 3
fprintf("Question 3\n");

m = 1.0;
l = 1.4;
c = 10;
g = 9.81;
theta = 0.79;
dtheta = 0;
t = 0;
h = 0.5;
Mt = @(t) exp(-5.0 * t);

while t <= 2.0
    fprintf("t: %.1f theta: %.4f dtheta: %.4f\n", t, theta, dtheta);
    k11 = dtheta;
    k12 = (1/(m*l^2))*(Mt(t) - c*dtheta - m*g*l*sin(theta));

    k21 = dtheta + (h/2)*k12;
    k22 = (1/(m*l^2))*(Mt(t + h/2) - c*(dtheta + (h/2)*k12) - m*g*l*sin(theta + (h/2)*k11));

    k31 = dtheta + (h/2)*k22;
    k32 = (1/(m*l^2))*(Mt(t + h/2) - c*(dtheta + (h/2)*k22) - m*g*l*sin(theta + (h/2)*k21));

    k41 = dtheta + h*k32;
    k42 = (1/(m*l^2))*(Mt(t + h) - c*(dtheta + h*k32) - m*g*l*sin(theta + h*k31));

    theta = theta + (h/6)*(k11 + 2*k21 + 2*k31 + k41);
    dtheta = dtheta + (h/6)*(k12 + 2*k22 + 2*k32 + k42);
    t = t + h;
end
