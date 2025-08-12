%% Week 3
% Gaussian Elimination
M = [
    6.1 1.2 3.5 4.5
    4.2 3.7 1.9 4.5
    3.5 4.9 3.1 4.2
    4.7 1.7 4.2 2.7
    ]

N = [
    1.2
    4.3
    4.4
    3.3
    ]

[L, U] = lu(M);
x1 = linsolve(M, N);
n = size(MN, 1);

MN = [M N];
for i = 1:n-1
    for j = i+1:n
        factor = MN(j,i)/MN(i,i);
        MN(j,i:end) = MN(j,i:end) - factor * MN(i,i:end);
    end
    fprintf('After elimination step %d:\n', i);
    disp(MN);
end
