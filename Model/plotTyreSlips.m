figure(4);
subplot 211
hold on, grid on, box on
ylabel('TYRE SLIP FRONT [deg]');
plot(out.tout', out.logsout{10}.Values(:,1).Data, 'DisplayName', 'Front tyre slip [deg]', 'LineWidth', 2.1);
title('Front tyre slip angle');
legend('Location','northwest');
xlabel('Time [s]');

figure(4);
subplot 212
hold on, grid on, box on
ylabel('TYRE SLIP REAR [deg]');
plot(out.tout', out.logsout{11}.Values(:,1).Data, 'DisplayName', 'Rear tyre slip [deg]', 'LineWidth', 2.1)
title('Rear tyre slip angle');
legend('Location','northwest');
xlabel('Time [s]');