figure('WindowState', 'maximized');
subplot 211
hold on, grid on, box on
ylabel('TYRE SLIP FRONT [deg]');
plot(out.tout', out.logsout.find('BlockPath', 'Model1/slip_angle_F[deg]').getElement(1).Values(:,1).Data, ...
     'DisplayName', 'Front tyre slip [deg]', 'LineWidth', 2.1);
title('Front tyre slip angle');
legend('Location','northwest');
xlabel('Time [s]');


subplot 212
hold on, grid on, box on
ylabel('TYRE SLIP REAR [deg]');
plot(out.tout', out.logsout.find('BlockPath', 'Model1/slip_angle_R[deg]').getElement(1).Values(:,1).Data, ...
      'DisplayName', 'Rear tyre slip [deg]', 'LineWidth', 2.1)
title('Rear tyre slip angle');
legend('Location','northwest');
xlabel('Time [s]');

saveas(gcf, 'simX_slips.png');