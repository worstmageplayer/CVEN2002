%% Week 5
t = [3.0 8.0 13.0 18.0];
p = [27 149 351 642];

for n = 1:length(t)
    if n + 2 > length(t)
        fprintf("false ");
    else
        output = (p(2 + n) - 2*p(1 + n) + p(n)) / ( t(2) - t(1) )^2;
        fprintf("%.4f ", output);
    end
end
fprintf("\n");

for n = 1:length(t)
    if n + 1 > length(t) || n - 1 <= 0
        fprintf("false ");
    else
        output = (p(1 + n) - 2*p(n) + p(n-1)) / ( t(2) - t(1) )^2;
        fprintf("%.4f ", output);
    end
end
fprintf("\n");

for n = 1:length(t)
    if n - 2 <= 0
        fprintf("false ");
    else
        output = (p(n) - 2*p(n - 1) + p(n - 2)) / ( t(2) - t(1) )^2;
        fprintf("%.4f ", output);
    end
end
fprintf("\n");
