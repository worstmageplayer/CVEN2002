%% Week 2
clear all;
%% Question 1
% Bisection Method
fprintf("Question 1\n");
range1 = 0.05;
range2 = 0.9000;
syms f(x);
f(x) = x*tan(x) - 0.1;
prevrangemid = (range1 + range2) / 2;

i = 0;
while i <= 3
    rangemid = (range1 + range2) / 2;
    t1 = f(range1);
    tmid = f(rangemid);
    t2 = f(range2);
    fprintf("xl: %.4f, xu: %.4f, xr: %.4f ", range1, range2, rangemid);
    if tmid < 0.0
        if t2 < 0.0
            range2 = ramgemid;
        else
            range1 = rangemid;
        end
    else
        if t2 < 0.0
            range1 = rangemid;
        else
            range2 = rangemid;
        end
    end
    i = i + 1;
    epsilon = abs((rangemid - prevrangemid) / rangemid) * 100;
    fprintf("err: %.4f\n", epsilon);
    prevrangemid = rangemid;
end

%% Question 2
% Newton Raphson Method
fprintf("Question 2\n");
% Variant 1
fprintf("variant 1\n");
Mm = 0.5;
guess = 0.5;
tolerance = 10 ^ -4;


for i = 1:100
    syms f(x);
    f(x) = cot(x) - Mm * x;
    syms df(x);
    df(x) = diff(f);

    x_new = guess - f(guess) / df(guess);

    err = abs((x_new - guess) / guess);

    guess = x_new;
    if err < tolerance
        break;
    end
end

fprintf("%.4f\n", guess);

% Variant 2
fprintf("variant 2\n");
x0 = 8.01;
x_new = x0;
syms f(x)
f(x) = exp(-(x-8.9)^2 / 2) - 1;
syms df(x)
df(x) = diff(x);

for i = 0:3
    fprintf("%d %.4f, %.4f\n", i, x_new, err);
    x_new = x0 - f(x0) / df(x0);
    err = abs((x_new - x0) / x0) * 100;
    x0 = x_new;
end

%% Question 3
% Secant Method
fprintf("Question 3\n");
g1 = 0.5625;
g2 = 0.825;
tolerance = 10 ^ -4;
R = 0.75;

syms f(x)
f(x) = 4 * x * (2*R - sqrt( 4*R^2 - (x/4)^2)) - (x/4)^2;

for i = 1:100
    f1 = f(g1);
    f2 = f(g2);

    approx = g2 - f2 * (g2 - g1) / (f2 - f1);
    err = abs((approx - g2) / approx);

    g1 = g2;
    g2 = approx;

    if err < tolerance
        break
    end
end

fprintf("%.4f\n", approx);
