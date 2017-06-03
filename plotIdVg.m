function plotIdVg(id, vg, vd)
for i = 1: length(vd)
    fig(i) = semilogy(vg, id(:, i), 'linewidth', 1.5);
    hold on
    leg{i} = ['V_d = ', num2str(vd(i)), 'V'];
end
xlabel('V_g (V)', 'fontsize', 15); ylabel('log I_d (log A) ', 'fontsize', 15)
legend(fig, leg, 'location', 'southeast')
set(gca, 'fontsize', 12)
