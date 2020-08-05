figure(2);
subplot 211
hold on, grid on, box on
yyaxis left
ylabel('X [m]');
plot(out.tout', out.logsout{14}.Values(:,1).Data, 'DisplayName', 'X\_pos [m]', 'LineWidth', 2.1);
yyaxis right
ylabel('Y [m]');
plot(out.tout', out.logsout{16}.Values(:,1).Data, 'DisplayName', 'Y\_pos [m]', 'LineWidth', 2.1)
title('X - Y Position wrt inertial frame');
legend('Location','northwest');
xlabel('Time [s]');

figure(2);
subplot 212
hold on, grid on, box on
yyaxis left
ylabel('X dot [m/s]');
plot(out.tout', out.logsout{13}.Values(:,1).Data, 'DisplayName', 'X\_dot [m/s]', 'LineWidth', 2.1);
yyaxis right
ylabel('Y dot [m/s]');
plot(out.tout', out.logsout{15}.Values(:,1).Data, 'DisplayName', 'Y\_dot [m/s]', 'LineWidth', 2.1)
title('X - Y Velocities wrt inertial frame');
legend('Location','northwest');
xlabel('Time [s]');