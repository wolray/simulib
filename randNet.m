function [x, y, a] = randNet(l, density, channel_length)
if nargin < 3
    channel_length = 10;
end
n = round((channel_length + 2 * l) * (10 + 2 * l) * density);
coordinates = rand(3, n);
a = 2 * pi * coordinates(3, :);
x = cumsum([(channel_length + 2) * coordinates(1, :); l * cos(a)]);
y = cumsum([(10 + 2 * l) * coordinates(2, :); l * sin(a)]);
