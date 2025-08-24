%% Week 5
%% Question 1
data = [65.3,63.4,62.9,63.1,62.2,64.1,65.0,64.9,63.9,63.9];
n = length(data);
xbar = mean(data);
sigma = std(data);
alpha = 0.02;
tcrit = tinv(1 - alpha / 2, n - 1);
marginOfError = tcrit * (sigma / sqrt(n));
lowerbound = xbar - marginOfError;
upperbound = xbar + marginOfError;
fprintf("CI: [%.4f, %.4f]\n", lowerbound, upperbound);

zcrit = norminv(1 - alpha / 2);
E = 0.4;
nreq = ceil((zcrit^2 * sigma^2) / E^2);
fprintf("Minimum: %.4f\n", nreq);

% Random sample of specimens
% Impact energy is normal

%% Question 2
n = 229;
x = 143;
phat = x/n;

alpha = 0.10;
zcrit = norminv(1 - alpha / 2);
marginOfError = zcrit * sqrt(phat * (1 - phat) / n);
lowerbound = phat - marginOfError;
upperbound = phat + marginOfError;
fprintf("CI: [%.4f, %.4f]\n", lowerbound, upperbound);
