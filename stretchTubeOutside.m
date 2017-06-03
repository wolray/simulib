function [xx, yy, aa] = stretchTubeOutside(ratio, x, y, a, gamma)
if nargin < 5
    gamma = 0;
end

l = round(10 * abs((x(1, 1) - x(2, 1)) * sec(a(1)))) / 10;

xx = x;
xx(1, :) = x(1, :) * ratio;
d = (x(2, :) - x(1, :)) .* (1 + gamma * (ratio - 1));
xx(2, :) = xx(1, :) + d;

yy = y;
yy(2, :) = sqrt(l ^ 2 - d .^ 2);

aa = atan(yy(2, :) ./ d);
aa(a < 0) = a(a < 0) + pi;
