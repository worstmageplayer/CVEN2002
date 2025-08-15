pH = [7 7 7 7 7 5 5 5 5 5 3 3 3 3 3];
wear = [7.12 6.63 6.78 6.83 6.93 6.45 6.33 6.67 6.62 6.73 6.61 6.35 6.80 6.56 6.45];

[p, tbl, stats] = anova1(wear, pH, 'off');

c = multcompare(stats, 'CType', 'bonferroni', 'Display', 'off');

fprintf('Test statistic: %.2f\n', tbl{2,5});
fprintf('P-value: %.3f\n', p);

significant_pairs = c(c(:,end) < 0.05/3, 1:2)

if ~isempty(significant_pairs)
    fprintf('Significant pairs (Bonferroni corrected, p < 0.0167):\n');
    for i = 1:size(significant_pairs, 1)
        fprintf('pH %d vs pH %d\n', significant_pairs(i,1), significant_pairs(i,2));
    end
else
    fprintf('No significant pairs found after Bonferroni correction.\n');
end
