%% Week 8
%% Question 1
fprintf("Question 1\n");
before = [1,0,3,0,1,4,2,1,1,3,5,2];
after = [4,0,7,3,3,6,2,1,4,4,7,3];

m1 = mean(before);
m2 = mean(after);

d = before - after;
dbar = mean(d);
sd = std(d);
n = length(d);
t = dbar / (sd / sqrt(n));

fprintf("t: %.4f\n", t);

pvalue = tcdf(t, n-1);
fprintf("p value: %.4f\n", pvalue);

%% Question 2
fprintf("Question 2\n");
cotton = [51.7,49.4,50.2,47.7,47.6,50.3,51.3,55.1,48.7,50.5,49.8,46.2];
acetate = [58.9,55.5,62.1,57.8,60.3,58.6,60.8,58.5,61.2,61.8,64.3,59.5];

mean_cotton = mean(cotton);
mean_acetate = mean(acetate);
std_cotton = std(cotton);
std_acetate = std(acetate);
n_cotton = length(cotton);
n_acetate = length(acetate);

alpha = 0.02;
freedom = n_cotton + n_acetate - 2;
sp = sqrt(((n_cotton - 1)*std_cotton^2 + (n_acetate - 1)*std_acetate^2) / freedom);
se = sp * sqrt(1/n_cotton + 1/n_acetate);
t_critical = tinv(1 - alpha / 2, freedom);
margin_of_error = t_critical * se;
ci_lower = (mean_acetate - mean_cotton) - margin_of_error;
ci_upper = (mean_acetate - mean_cotton) + margin_of_error;

fprintf("ci: [%.4f, %.4f]\n", ci_lower, ci_upper);
fprintf("Data are approximately normal. (Seems reasonable from the normal quantile plot.)\n")
fprintf("Standard deviations are equal. (Seems reasonable, from the data.)\n")
fprintf("We have two independent random samples of measurements. (Whether this is satisfies depends on the study design.) \n")
