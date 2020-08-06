%% plot the results of the sim
close all

figure(1);
track3d(1);
hold on;

egoZ = zeros(size(out.egoX_Pos, 1));
egoZ = egoZ + 3;
plot3(out.egoX_Pos, out.egoY_Pos, egoZ, 'b-', 'LineWidth', 2.5);
title('X-Y positions');
xlabel('X pos [m]');
ylabel('Y pos [m]');
grid on;

hold off;