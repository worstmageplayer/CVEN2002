%% Week 4
clear all
%% Question 1
% Trapezoidal Rule
fprintf("Question 1\n");
syms f(x);
f(x) = 0.4723 * cos(x/9) *(x - 3);
exact = 10.0323;
a = 3;
b = 12;
n = 2;
c = linspace(a, b, n + 1);

trap = f(c(1)) + f(c(n + 1));

for i = 2:n
    trap = trap + 2*f(c(i));
end

trap = trap*(b - a)/2/n;
err = abs((exact - trap) / exact) * 100;

fprintf("%.4f %.4f\n", trap, err);
%% Question 2
% Simpson's 1/3 Rule
fprintf("Question 2\n");
syms f(x);
f(x) = 1.56 * cos(1 * (x - 12) / 4);
exact = 5.674;
a = 4;
b = 12;
n = 8;
c = linspace(a, b, n + 1);
simp13 = f(c(1)) + f(c(n + 1));

for i = 2:n
    if (rem(i-1, 2) == 0)
        simp13 = simp13 + 2 * f(c(i));
    else
        simp13 = simp13 + 4 * f(c(i));
    end
end

simp13 = simp13*(b - a)/3/n;
err = abs((exact - simp13) / exact) * 100;

fprintf("%.4f %.4f\n", simp13, err);

%% Question 3
% Simpson's 3/8 Rule
fprintf("Question 3\n");
syms f(x);
f(x) = 1.494 * cos((x-6.0) / 5);
exact = 12.5716;
a = 1;
b = 11;
n = 6;
c = linspace(a, b, n + 1);
simp38 = f(c(1)) + f(c(n + 1));

for i = 2:n
    if mod((i+2), 3) == 0
        simp38 = simp38 + 2 * f(c(i));
    else
        simp38 = simp38 + 3 * f(c(i));
    end
end

h = (b - a) / n;
simp38 = simp38 * 3 * h / 8;
err = abs((exact - simp38) / exact) * 100;

fprintf("%.4f %.4f\n", simp38, err);
