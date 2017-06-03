function vt = plotVt(id, vg, vd)
[m, ws] = min(abs(vd));
[m, wl] = max(abs(vd));

figure
fig = plot(vg, id(:, ws));
legend(['Vd = ', num2str(vd(ws)), ' V'], 'location', 'north')
xlabel('Vg (V)' ); ylabel('Id (A)' )

figure
fig = plot(vg, sqrt(id(:, wl)));
legend(['Vd = ', num2str(vd(wl)), ' V'], 'location', 'north')
xlabel('Vg (V)' ); ylabel('Id ^ {-1 / 2} (A ^ {-1 / 2})' )

end
