figure('WindowState', 'maximized');
subplot 211
hold on, grid on, box on
yyaxis left
ylabel('YAW ANGLE [deg]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/yaw_angle[deg]').getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Yaw\_angle [deg]', 'LineWidth', 2.1);

yyaxis right
ylabel('YAW RATE [deg/s]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/yaw_rate[degs^-1]').getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Yaw\_rate [deg/s]', 'LineWidth', 2.1)
title('Vehicle yaw angle and yaw rate');
legend('Location','northwest');
xlabel('Time [s]');

subplot 212
hold on, grid on, box on
ylabel('BODY SLIP ANGLE [deg]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/body_slip[deg]').getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Body\_slip [deg]', 'LineWidth', 2.1);
title('Vehicle body slip angle');
legend('Location','northwest');
xlabel('Time [s]');

saveas(gcf, 'simX_angles.png');
