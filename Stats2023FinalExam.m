%% Question 1
clear all
clc

weeks = [5 7 1 2 9 4 6 12];
cars = [15 21 14 13 23 14 18 21];

mdl = fitlm(weeks, cars);
mdl.Coefficients.Estimate(1)
x = mdl.Coefficients.Estimate(2)

a = mdl.Rsquared.Ordinary
sqrt(a)

predictedValue = predict(mdl, 5)

[~, ci] = predict(mdl, 5, "Alpha", 0.02)
[~, p] = predict(mdl, 5, "Alpha", 0.02, "prediction", "Observation")

x*3

n = length(weeks);
se = mdl.Coefficients.SE(2);
lower = x*3 - tinv(0.975, n - 2) * 3 * se
upper = x*3 + tinv(0.975, n - 2) * 3 * se

mdl.Coefficients.tStat(2)
mdl.DFE
mdl.Coefficients.pValue(2)

%% Question 2
clear all
clc

n = 152;
x = 57;
p0 = 0.33;

phat = x/n;
se = sqrt(p0 * (1 - p0) / n);

z = (phat - p0) / se
pvalue = 1 - normcdf(z, 0, 1)



%% Question 3
clear all
clc

Alloy = categorical([1,1,1,2,2,2,2,2,3,3,3,3,4,4,4,4]);

Current = [1.025, 0.991, 1.049, 0.993, 0.988, 1.01, 1.001, 0.984, 1.034, 1.107, 1.102, 1.011, 1.01, 1.034, 1.073, 1.016];

[p,tbl,stats]  = anova1(Current, Alloy, "off");
% boxplot(Current, Alloy
p
tbl

four = Current(Alloy == "4");
two = Current(Alloy == "2");

[h,p,ci,stats] = ttest2(four, two, "Vartype", "unequal", "Alpha", 0.05);
ci