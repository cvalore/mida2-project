%% plot the results of the sim
close all

figure('WindowState', 'maximized');
track3d(1);
hold on;

egoZ = zeros(size(out.egoX_Pos, 1));
egoZ = egoZ + 3;
plot3(out.egoX_Pos, out.egoY_Pos, egoZ, 'b-', 'LineWidth', 3);
title('X-Y positions');
xlabel('X pos [m]');
ylabel('Y pos [m]');
grid on;

hold off;

saveas(gcf, 'simX_trajectory.png');