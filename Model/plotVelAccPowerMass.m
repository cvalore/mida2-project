figure(5);
subplot 211
hold on, grid on, box on
yyaxis left
ylabel('v_T [m/s]');
plot(out.tout', out.logsout{12}.Values(:,1).Data, 'DisplayName', 'Velocity [m/s]', 'LineWidth', 2.1);
yyaxis right
ylabel('v_{T}dot [m/s^2]');
plot(out.tout', out.logsout{4}.Values(:,1).Data, 'DisplayName', 'Acceleration [m/s^2]', 'LineWidth', 2.1)
title('Vehicle velocity and acceleration');
legend('Location','northwest');
xlabel('Time [s]');

figure(5);
subplot 212
hold on, grid on, box on
yyaxis left
ylabel('Power [W]');
plot(out.tout', out.logsout{8}.Values(:,1).Data, 'DisplayName', 'Power [W]', 'LineWidth', 2.1);
yyaxis right
ylabel('Mass [kg]');
plot(out.tout', out.logsout{7}.Values(:,1).Data, 'DisplayName', 'Mass [kg]', 'LineWidth', 2.1)
title('Power output and mass of the vehicle');
legend('Location','northwest');
xlabel('Time [s]');
