%% plot the results of the sim
close all

figure('WindowState', 'maximized');
track3d(1); 
hold on;

egoZ = zeros(size(out.tout, 1));
egoZ = egoZ + 3;
%axis([-800 1000 -1500 800]) %used for sim7
plot3(out.logsout.find('BlockPath', 'Model1/x_pos[m]').getElement(1).Values(:,1).Data, ...
     out.logsout.find('BlockPath', 'Model1/y_pos[m]').getElement(1).Values(:,1).Data, ...
     egoZ', 'b-', 'LineWidth', 3);
title('X-Y positions');
xlabel('X pos [m]');
ylabel('Y pos [m]');
grid on;

hold off;

saveas(gcf, 'simX_trajectory.png');