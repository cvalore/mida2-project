function plotBanking(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 211
hold on, grid on, box on
yyaxis left
ylabel('X [m]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/x_pos[m]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'X\_pos [m]', 'LineWidth', 2.1);
yyaxis right
ylabel('Y [m]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/y_pos[m]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Y\_pos [m]', 'LineWidth', 2.1)
title('X - Y Position wrt inertial frame');
legend('Location','northwest');
xlabel('Time [s]');

subplot 212
hold on, grid on, box on
ylabel('BANKING ANGLE [deg]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/gamma[deg]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'gamma [deg]', 'LineWidth', 2.1);
title('Road banking angle');
legend('Location','northwest');
xlabel('Time [s]');

saveas(gcf, 'simX_banking.png');