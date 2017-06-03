function toSpice(ratio, l, beta, a, x_cross, vertical_angle, channel_length)
fprintf('=== step 3 (toSpice) ===\n'); start = tic;
if nargin < 7
    channel_length = 10;
    if nargin < 6
        vertical_angle = pi / 2;
    end
end
x_source = l * sin(vertical_angle) * ratio;
x_drain = (channel_length + l * sin(vertical_angle)) * ratio;
sp = fopen('network.sp', 'wt');
fprintf(sp, ['network (matlab) \n', '.op\n']);
fprintf(sp, ['v source drain 10\n']);
secx = abs(sec(a));
n = size(x_cross, 1);
x_cross_diag = x_cross + x_cross' - diag(diag(x_cross));
j_temp = 0;
j_cross_temp = 0;
for i = 1: n
    where = find(x_cross_diag(i, :));
    if length(where) > 1
        [x_cross_sort, sorted_indexes] = sort(x_cross_diag(i, where));
        i_str = num2str(i);
        if x_cross_diag(i, where(sorted_indexes(1))) == x_source;
            net2 = 'source';
        else
            net2 = [i_str, 'x', num2str(where(sorted_indexes(1)))];
        end
        for j = 1: length(sorted_indexes) - 1
            net1 = net2;
            if x_cross_diag(i, where(sorted_indexes(j + 1))) == x_drain
                net2 = 'drain';
            else
                net2 = [i_str, 'x', num2str(where(sorted_indexes(j + 1)))];
            end
            ri = ['r', num2str(j_temp + j)];
            r = l * secx(i) * (x_cross_sort(j + 1) - x_cross_sort(j));
            rstr = num2str(r);
            fprintf(sp, [ri, ' ', net1, ' ', net2, ' ', rstr, '\n']);
        end
        j_temp = j_temp + j;
    end
    where_cross = find(x_cross(i, :));
    if length(where_cross) > 1
        for j_cross = 1: length(where_cross)
            rci = ['rc', num2str(j_cross + j_cross_temp)];
            net1 = [num2str(i), 'x', num2str(where_cross(j_cross))];
            net2 = [num2str(where_cross(j_cross)), 'x', num2str(i)];
            if i ~= where_cross(j_cross)
                fprintf(sp, [rci, ' ', net1, ' ', net2, ' ', num2str(beta), '\n']);
            end
        end
        j_cross_temp = j_cross_temp + j_cross;
    end
end
fprintf(sp, '.end');
fclose('all');
fprintf('elapsed time is %.1f s\n', toc(start));
