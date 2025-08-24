%% Week 4
%% Question 1
fprintf("Question 1\n");

data = [3.4, 0.7, 13.4, 14.8, 34.8, 27.0, 30.9, 13.2, 23.6, 9.6, 17.4, 28.6, 22.1, 11.6, 15.6, 4.5, 33.2, 20.0, 26.8, 0.6, 28.8, 22.5, 23.8, 1.7, 26.6, 15.7, 21.9, 34.2, 27.9, 23.7];
n = length(data);
sigma = 12;
standardErr = sigma / sqrt(n);
fprintf("standard error: %.4f\n", standardErr);
%% Question 2
fprintf("Question 2\n");
