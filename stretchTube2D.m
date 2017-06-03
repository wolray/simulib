function [xx, yy, aa] = stretchTube2D(ratio, x, y, a)

l = round(10 * abs((x(1, 1) - x(2, 1)) * sec(a(1)))) / 10;

xx = x;
xx(1, :) = x(1, :) * ratio;
d = (x(2, :) - x(1, :));
xx(2, :) = xx(1, :) + d;

yy = y;
aa = a;
