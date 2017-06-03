function plotIdVd(id, vd, vg)
for i = 1: length(vg)
    fig(i) = plot(vd, id(:, i), 'linewidth', 3);
    hold on
    leg{i} = ['V_g = ', num2str(vg(i)), 'V'];
end
xlabel('V_d (V) ', 'fontsize', 20); ylabel('I_d (A) ', 'fontsize', 20)
legend(fig, leg, 'location', 'northwest')
set(gca, 'fontsize', 20)
