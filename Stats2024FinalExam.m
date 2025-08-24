%% Question 1
weight = [205 125 115 170 155 99 220];
height = [70 65 63 69 68 61 72];

y = polyfit(weight, height, 1);
y_fit = polyval(y, weight);
fprintf("ai) y(x) = %.4f + %.4fx\n", y(2), y(1));

total = sum((height - mean(height)).^2);
residue = sum((height - y_fit).^2);
fprintf("aii) %.4f\n", (1 - residue/total));

r = corrcoef(weight, height);
fprintf("aiii) Correlation: %.4f\n", r(1, 2));

heightEstimate = polyval(y, 87);

fprintf("b) Estimated Height: %.4f\n", heightEstimate);

mdl = fitlm(weight, height);
[pred, delta] = predict(mdl, 100, 'Confidence', 0.97);
fprintf("c) CI: [%.4f, %.4f]\n", delta(1), delta(2));
