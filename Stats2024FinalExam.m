%% Question 1
weight = [46.84, 82.54, 57.49, 77.92, 63.29, 97.9, 95.89];
height = [164.2, 181.8, 173, 179.6, 168.6, 188.4, 184];
mdl = fitlm(weight, height);

%% Question 4
clear all
fprintf("\nQuestion 4\n");

levels = [6.67, 7.56, 3.82, 6.01, 7.95, 6.03, 5.01, 6.51, 5.01, 5.59, 5.91, 9.1, 4.41, 6.39, 4.64, 4.36, 8.1, 3.7, 6.73, 4.54, 4.66, 4.53, 3.27, 4.13, 8.55, 6.08, 10, 13.09, 5.87, 5.7, 5.93, 8.57, 6.92, 5.4, 11.48, 4.53];
patients = categorical(["normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH"]);
alpha = 0.01;

[panova, tbl, stats] = anova1(levels, patients, "off");

%boxplot(levels, patients);

fprintf("T value: %.4f\n", tbl{2, 5});
fprintf("P value: %.4f\n", panova);

a = levels(patients == "activeH");
b = levels(patients == "inactiveH");

n1 = length(a);
n2 = length(b);

mean1 = mean(a);
mean2 = mean(b);

MSE = tbl{3, 2} / tbl{3, 3};
se = sqrt(MSE * (1/n1 + 1/n2));

tstat = (mean1 - mean2) / se;
p_value = 2 * (1 - tcdf(abs(tstat), stats.df));

fprintf("t stat: %.4f\n", tstat);
fprintf("length: %d\n", stats.df);
fprintf("P value: %.6f\n", p_value);

if p_value > alpha
    fprintf("no evidence\n");
else
    fprintf("yes evidence\n");
end

