function [x_cross, y_cross] = cross(ratio, x, y, a, vertical_angle, channel_length)

fprintf('=== step 1 (cross) ===\n'); start = tic;

if nargin < 6
    channel_length = 10;
    if nargin < 5
        vertical_angle = pi / 2;
    end
end
l = round(10 * abs((x(1, 1) - x(2, 1)) * sec(a(1)))) / 10;
x_source = l * sin(vertical_angle) * ratio;
x_drain = (channel_length + l * sin(vertical_angle)) * ratio;
k = tan(a);
b = y(1, :) - k .* x(1, :);
n = size(a, 2);
x_cross = zeros(n);
y_cross = zeros(n);

for i1 = 1: (n - 1)
    for i2 = (i1 + 1): n
        x_temp=-(b(i1) - b(i2)) / (k(i1) - k(i2));
        y_temp=-(b(i1) * k(i2) - b(i2) * k(i1)) / (k(i1) - k(i2));
        if min(x(1, i1), x(2, i1)) < x_temp && x_temp < max(x(1, i1), x(2, i1)) && min(x(1, i2), x(2, i2)) < x_temp && x_temp < max(x(1, i2), x(2, i2)) && x_source < x_temp && x_temp < x_drain
            x_cross(i1, i2) = x_temp;
            y_cross(i1, i2) = y_temp;
        end
    end
end

for i = 1: n
    if (x(1, i) - x_source) * (x(2, i) - x_source) < 0
        x_cross(i, i) = x_source;
        y_cross(i, i) = y(1, i) - (x(1, i) - x_source) * tan(a(i));
    elseif (x(1, i) - x_drain) * (x(2, i) - x_drain) < 0
        x_cross(i, i) = x_drain;
        y_cross(i, i) = y(1, i) - (x(1, i) - x_drain) * tan(a(i));
    end
end

fprintf('elapsed time is %.1f s\n', toc(start));
