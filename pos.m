function [id, v1, v2] = pos(id, v1, v1_pos, v2, v2_pos);
for k1 = 1: length(v1_pos)
    wi(k1) = find(v1 == v1_pos(k1));
end
for k2 = 1: length(v2_pos)
    wj(k2) = find(v2 == v2_pos(k2));
end
id = id(wi, wj);
v1 = v1_pos;
v2 = v2_pos;
end
