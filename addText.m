function addText(region, str, size)
txt = text(region(1) +.475 * (region(2) - region(1)), region(3) +.075 * (region(4) - region(3)), str);
set(txt, 'fontsize', size)
