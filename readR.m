function [ids, r] = readR()
fprintf('=== step 4 (readR) ===\n'); start = tic;
lis = fopen('network.lis');
fseek(lis, 0, -1);

while ~feof(lis)
    if strcmp(fgetl(lis), ' ****  voltage sources')
       break
    end
end

fseek(lis, 77, 0);
ids0 = fgetl(lis);
if ids0(end) == 'k'
    ids = abs(sscanf(ids0, '%f') * 1e3);
elseif ids0(end) == 'm'
    ids = abs(sscanf(ids0, '%f') * 1e-3);
elseif ids0(end) == ' '
    ids = abs(str2num(ids0));
else
    ids = inf;
end

r = 10 / ids;
fclose('all');
fprintf('elapsed time is %.1f s\n\n', toc(start));
