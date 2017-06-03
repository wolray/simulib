function [xx, yy, aa] = stretchTubeInside(ratio, x, y, a)
l = round(10 * abs((x(1, 1) - x(2, 1)) * sec(a(1)))) / 10;

d = (x(2, :) - x(1, :)) .* ratio;

aa = atan(y(2, :) ./ d);
aa(a < 0) = a(a < 0) + pi;

xx = x; yy = y;
xo = ratio * (x(1, :) + x(2, :)) / 2;
yo = (y(1, :) + y(2, :)) / 2;

xx(1, :) = xo - l * cos(aa) / 2;
xx(2, :) = xo + l * cos(aa) / 2;
yy(1, :) = yo - l * sin(aa) / 2;
yy(2, :) = yo + l * sin(aa) / 2;
