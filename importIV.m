function [id, v1, v2] = importIV(file, index)
f = importdata(file);
data = f.data;
v2 = unique(data(:, index(3)));
v2s = length(v2);
obs = size(data, 1) / v2s;
id = zeros(obs, v2s);
for i = 1: v2s
    v1 = data(1: obs, index(2));
    id(:, i) = abs(data(data(:, index(3)) == v2(i), index(1)));
end
fprintf('\n=== ImportIV (%s) ===\n', file)
fprintf('v1: %.1f: %.2f: %.1f\n', v1(1), v1(2) - v1(1), v1(end))
fprintf('v2: ')
for i = v2
    fprintf(' %.1f', i)
end
fprintf('\n')
end
