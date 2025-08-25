%% Question 1
fprintf("\nQuestion 1\n");
clear all
weight = [155 125 170 115 205 220 99];
height = [68 65 69 63 70 72 61];

mdl = fitlm(weight, height);
a = mdl.Coefficients.Estimate(1);
b = mdl.Coefficients.Estimate(2);

fprintf("equation: %.4f + %.4fx\n", a, b);

rsquared = mdl.Rsquared.Ordinary;
fprintf("proportion of variability: %.4f\n", rsquared);

correlation = sqrt(rsquared);
fprintf("observed sample correlation: %.4f\n", correlation);

predicted_height = predict(mdl, 100);
fprintf("predicted height: %.4f\n", predicted_height);

[~, ci]  = predict(mdl, 100, "Alpha", 0.03);
fprintf("confidence interval: [%.4f, %.4f]\n", ci(1), ci(2));

[~, predictInterval] = predict(mdl, 100, "Alpha", 0.03, "Prediction", "observation");
fprintf("prediction interval: [%.4f, %.4f]\n", predictInterval(1), predictInterval(2));

fprintf("expected change: %.4f\n", b * 4);

tstat = mdl.Coefficients.tStat(2);
pvalue = mdl.Coefficients.pValue(2);
df = mdl.DFE;

fprintf("t stat: %.4f\n", tstat);
fprintf("degrees of freedom: %d\n", df);
fprintf("p value: %.8f\n", pvalue);

if pvalue < 0.05
    fprintf("Reject\n");
else
    fprintf("Dp not reject\n");
end

%% Question 2
fprintf("\nQuestion 2\n");
clear all
p = 0.45;
size = 23;

expected = p * size;
sd = sqrt(size * p * (1 - p));

fprintf("Expected: %.4f\n", expected);
fprintf("Standard Deviation: %.4f\n", sd);

exact = 1 - binocdf(11, size, p);
fprintf("Exact: %.4f\n", exact);

z = (11.5 - expected) / sd;
prob = 1 - normcdf(z, 0, 1);
fprintf("Approx Prob: %.4f\n", prob);

size2 = 127;
eX1X2 = (size + size2) * p;
vX1X2 = size * p * (1 - p) + size2 * p * (1 - p);
fprintf("E(X1 + X2): %.4f\n", eX1X2);
fprintf("Var(X1 + X2): %.4f\n", vX1X2);

ntotal = size + size2;
p79 = 1 - binocdf(80, ntotal, p);
p70 = binocdf(69, ntotal, p);

probability = p79 + p70;
fprintf("Probability: %.4f\n", probability);

%% Question 4
clear all
fprintf("\nQuestion 4\n");


levels = [8.6, 3.4, 5.7, 7.48, 5.77, 4.09, 5.94, 4.7, 5.37, 7.15, 5.8, 6.38, 6.49, 3.61, 4.1, 3.4, 6.16, 3.22, 4.27, 4.05, 5.28, 3.96, 7.48, 3.04, 2.4, 3.87, 4.27, 9.9, 14.3, 5.75, 5.03, 6.82, 7.9, 5.02, 5.37, 5.74, 10.6, 8.36, 7.85];
patients = categorical(["normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "activeH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH", "inactiveH"]);
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

