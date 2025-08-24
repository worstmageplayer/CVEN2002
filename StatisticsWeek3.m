%% Week 3
%% Question 1
fprintf("Question 1\n");
lambda = 28;

sd = sqrt(lambda);
fprintf("Standard Deviation: %.4f\n", sd);

p_exceed = 1 - sum(poisspdf(0:40, lambda));
fprintf("Exceed: %.4f\n", p_exceed);

p_between = sum(poisspdf(22:40, lambda));
fprintf("Between: %.4f\n", p_between);

%% Question 2
fprintf("Question 2\n");
mean = 3500;
sd = 615;

less = normcdf(3000, mean, sd);
fprintf("Less: %.4f\n", less);

between = normcdf(4500, mean, sd) - normcdf(3000, mean, sd);
fprintf("Between: %.4f\n", between);

inv = norminv(0.97, mean, sd);
fprintf("Inv: %.4f\n", inv);
