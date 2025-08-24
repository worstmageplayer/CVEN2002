%% Week 2
%% Question 1
fprintf("Question 1\n");

xVal = [0, 1, 2, 6];
prob = [0.4, 0.1, 0.2, 0.3];

if length(xVal) ~= length(prob)
    fprintf("ERROR");
    return;
end

muX = 0;
for i = 1:length(xVal)
    muX = muX + xVal(i) * prob(i);
end
fprintf("muX: %.4f\n", muX);

varX = 0 - muX^2;
for i = 1:length(xVal)
    varX = varX + xVal(i)^2 * prob(i);
end
fprintf("varX: %.4f\n", varX);

meanY = 7 + 6*muX;
fprintf("meanY: %.4f\n", meanY);
varY = 6^2 * varX;
fprintf("varY: %.4f\n", varY);

%% Question 2
fprintf("Question 2\n");
f = @(x) 6*x-2*x.^2;
I = integral(f, 0, 3);
C = 1/I;
fprintf("C: %.4f\n", C);

Ex = integral(@(x) x .* C .* f(x), 0, 3);
fprintf("Ex: %.4f\n", Ex);
