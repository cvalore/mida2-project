hefunction plotLateralController(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
hold on, grid on, box on
ylabel('Lateral error [m]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/Controller/Lateral_controller/error')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Lateral error [m]', 'LineWidth', 2.1);
title('Lateral error');
legend('Location','northwest');
xlabel('Time [s]');

% saveas(gcf, 'simX_latController.png');