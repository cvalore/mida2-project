figure('WindowState', 'maximized');
subplot 211
hold on, grid on, box on
yyaxis left
ylabel('v_T [m/s]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/vT[ms^-1]').getElement(1).Values(:,1).Data, ...
      'DisplayName', 'Velocity [m/s]', 'LineWidth', 2.1);
yyaxis right
ylabel('v_{T}dot [m/s^2]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/acceleration[ms^-2]').getElement(1).Values(:,1).Data, ...
      'DisplayName', 'Acceleration [m/s^2]', 'LineWidth', 2.1)
title('Vehicle velocity and acceleration');
legend('Location','northwest');
xlabel('Time [s]');


subplot 212
hold on, grid on, box on
yyaxis left
ylabel('Power [W]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/power[W]').getElement(1).Values(:,1).Data, ...
      'DisplayName', 'Power [W]', 'LineWidth', 2.1);
yyaxis right
ylabel('Mass [kg]');
plot(out.tout', out.logsout.find('BlockPath', 'Model3/mass[kg]').getElement(1).Values(:,1).Data, ...
      'DisplayName', 'Mass [kg]', 'LineWidth', 2.1)
title('Power output and mass of the vehicle');
legend('Location','northwest');
xlabel('Time [s]');

saveas(gcf, 'simX_vel-power.png');