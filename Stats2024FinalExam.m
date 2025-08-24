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

