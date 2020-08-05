figure(3);
subplot 211
hold on, grid on, box on
yyaxis left
ylabel('YAW ANGLE [deg]');
plot(out.tout', out.logsout{17}.Values(:,1).Data, 'DisplayName', 'Yaw\_angle [deg]', 'LineWidth', 2.1);
yyaxis right
ylabel('YAW RATE [deg/s]');
plot(out.tout', out.logsout{18}.Values(:,1).Data, 'DisplayName', 'Yaw\_rate [deg/s]', 'LineWidth', 2.1)
title('Vehicle yaw angle and yaw rate');
legend('Location','northwest');
xlabel('Time [s]');

figure(3);
subplot 212
hold on, grid on, box on
ylabel('BODY SLIP ANGLE [deg]');
plot(out.tout', out.logsout{5}.Values(:,1).Data, 'DisplayName', 'Body\_slip [deg]', 'LineWidth', 2.1);
title('Vehicle body slip angle');
legend('Location','northwest');
xlabel('Time [s]');
