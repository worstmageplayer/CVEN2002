%% Week 1
clear all;
% Question 1
fprintf("Question 1\n");
% variant 1
fprintf("variant 1\n");
initBactConc = 7;
weeks = 9.0;
stepSize = 1.5;

C_n = initBactConc;
C_n1 = initBactConc;

syms d(c, t)
d(c, t) = - 0.04 * c;

i = 0;
while i <= weeks
    fprintf("%.1f : %.4f\n", i, C_n1);
    C_n1 = C_n + stepSize * d(C_n, i);
    i = i + stepSize;
    C_n = C_n1;
end
fprintf("2: The solution will become less accurate.\n");
fprintf("\n");

% variant 2
clear all;
fprintf("variant 2\n");
m = 4500;
c = 7762.5;
stepSize = 0.2;

v_n = 6.0;
v_n1 = v_n;

syms d(v, t)
d(v, t) = - v * c/m;

t = 0;
while t <= 1.4
    fprintf("%.4f : %.4f\n", t, v_n1);
    v_n1 = v_n + stepSize * d(v_n, t);
    t = t + stepSize;
    v_n = v_n1;
end
fprintf("\n");

% Question 2
clear all;
fprintf("Question 2\n");
x_0 = 1.05;
xx = 1.0;

syms f(x)
f(x) = 1/ (0.5 * x + 0.6)^3;
f_exact = double(subs(f, x, xx));

for n = 0:3
    Tf = taylor(f, x, 'ExpansionPoint', x_0, 'Order', n + 1);
    f_n_x = double(subs(Tf, x, xx));
    epsilon_a = abs((f_n_x - f_exact) / f_exact) * 100;
    fprintf("%.4f : %.4f\n", f_n_x, epsilon_a);
end
fprintf("\n");
