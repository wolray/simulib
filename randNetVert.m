function [x, y, a] = randNetVert(l, density, vertical_angle, channel_length)
if nargin < 4
    channel_length = 10;
end
n = round(channel_length + 2 * l * sin(vertical_angle)) * density;
a = pi / 2 - (2 * rand(1, n) - 1) * vertical_angle;
x = cumsum([linspace(0, (channel_length + 2 * l * sin(vertical_angle)), n); l * cos(a)]);
y = [zeros(1, n); l * sin(a)];
