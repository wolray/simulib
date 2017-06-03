function addTextLog(coordinates, str, size)
txt = text(coordinates(1) +.475 * (coordinates(2) - coordinates(1)), 10 ^ (coordinates(3) +.075 * (coordinates(4) - coordinates(3))), str);
set(txt, 'fontsize', size)
