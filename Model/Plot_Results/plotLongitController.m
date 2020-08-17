function plotLongitController(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 211
hold on, grid on, box on
ylabel('Velocity [m/s]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/Controller/Longitudinal_controller/v_ref')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Velocity ref [m/s]', 'LineWidth', 2.1);
title('Velocity profile');
legend('Location','northwest');
xlabel('Time [s]');

subplot 212
hold on, grid on, box on
ylabel('Velocity [m/s]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/Controller/Longitudinal_controller/v_ref')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Velocity ref [m/s]', 'LineWidth', 2.1);
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/Controller/Longitudinal_controller/v[ms^-1]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Velocity vehicle [m/s]', 'LineWidth', 2.1);
title('Velocity profile vs vehicle velocity');
legend('Location','northwest');
xlabel('Time [s]');

% saveas(gcf, 'simX_longController.png');