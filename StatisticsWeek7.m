%% Week 7
%% Question 1
fprintf("Question 1\n");
n = 80;
x = 12;
p_0 = 0.11;
phat = x / n;

z = (phat - p_0) / sqrt(p_0 * (1 - p_0) / n);
fprintf("z: %.4f\n", z);

fprintf("N(0, 1)\n");

pvalue = 1 - normcdf(z);
fprintf("p value: %.4f\n", pvalue);

if pvalue < 0.05
    fprintf('There is evidence against H0, that is, there is evidence that mathematically minded people are more likely to be left-handed.\n');
else
    fprintf('There is no evidence against H0, that is, there is no evidence that mathematically minded people are more likely to be left-handed.\n');
end

%% Question 2
fprintf("Question 2\n");
data = [7.4    8.9   11.5    9.9    9.7    6.4    6.9    8.5    7.8    4.7    5.0   10.1    6.5   12.2    3.6    8.9];
n = length(data);
mu = 10;
m = mean(data);
sd = std(data);

t = (m - mu) / (sd / sqrt(n));
fprintf("t: %.4f\n", t);

pvalue = tcdf(t, n-1);
fprintf("p value: %.4f\n", pvalue);

if pvalue < 0.05
    fprintf('Hence, there is strong evidence against H0, that is, there is strong evidence that the download speed is less than 10Mb per second.');
else
    fprintf('Hence, there is no strong evidence against H0, that is, there is no strong evidence that the download speed is less than 10Mb per second.');
end