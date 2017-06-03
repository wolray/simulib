function [x, y, x_cross, y_cross] = trim(x, y, x_cross, y_cross)
fprintf('=== step 2 (trim) ===\n'); start = tic;
n = size(x, 2);

for times = 1: 10
    conv_mark = length(find(x_cross));
    for i = 1: n
        if length(find(x_cross(i, :))) + length(find(x_cross(:, i))) - (x_cross(i, i) ~= 0) <= 1
            x_cross(i, :) = 0;
            x_cross(:, i) = 0;
            y_cross(i, :) = 0;
            y_cross(:, i) = 0;
        end
    end
    if conv_mark == length(find(x_cross))
        break
    end
end

xc2 = x_cross + x_cross' - diag(diag(x_cross));
yc2 = y_cross + y_cross' - diag(diag(y_cross));
for i = 1: n
    if length(find(xc2(i, :))) > 1
        pos = find(xc2(i, :));
        if x(1, i) < x(2, i)
            [x(1, i), m1] = min(xc2(i, pos));
            [x(2, i), m2] = max(xc2(i, pos));
        else
            [x(1, i), m1] = max(xc2(i, pos));
            [x(2, i), m2] = min(xc2(i, pos));
        end
        y(1, i) = yc2(i, pos(m1));
        y(2, i) = yc2(i, pos(m2));
    else
        x(:, i) = 0;
        y(:, i) = 0;
    end
end

fprintf('trimming iterations: %d\n', times);
fprintf('elapsed time is %.1f s\n', toc(start));
