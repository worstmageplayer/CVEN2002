%% Week 1
fprintf("\nQuestion 1\n");
data = [47, 69, 60, 51, 63, 13, 22, 47, 33, 87, 46, 24, 65, 71, 75, 86, 95, 83, 53, 22, 65, 55, 59, 74, 26, 69, 97, 52, 61, 10, 80, 90, 18, 83, 83, 17, 79, 3, 31, 60];

m = mean(data);
fprintf("mean: %.4f\n", m);

s = std(data);
fprintf("std: %.4f\n", s);

first = min(data);
second = prctile(data, 25);
third = median(data);
fourth = prctile(data, 75);
fifth = max(data);

fprintf("%.4f, %.4f, %.4f, %.4f, %.4f\n", first, second, third, fourth, fifth);

iqr = fourth - second;
fprintf("iqr: %.4f\n", iqr);
fprintf("below: %.4f\n", second - 1.5*iqr);
fprintf("above: %.4f\n", fourth + 1.5*iqr);

%% Question 2
fprintf("\nQuestion 2\n");
data = [6.2, 14.0, 7.4, 7.6, 15.4, 13.5, 13.8, 0.3, 12.4, 14.2, 10.8, 14.0, 14.9, 13.4, 5.5];

figure;
subplot(2, 1, 1);
histogram(data, 'Normalization', 'probability');
title('Histogram of Data');
xlabel('Value');
ylabel('Probability');

subplot(2, 1, 2);
boxplot(data);
title('Boxplot of Data');
ylabel('Value');
