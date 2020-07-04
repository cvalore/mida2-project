%% plot the results of the sim

track3d();
hold on;

plot(out.egoX_Pos, out.egoY_Pos, 'b-', 'LineWidth', 2.5);
title('X-Y positions');
xlabel('X pos [m]');
ylabel('Y pos [m]');
grid on;

hold off;