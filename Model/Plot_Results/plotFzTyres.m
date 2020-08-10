function plotFzTyres(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 211
hold on, grid on, box on
ylabel('F zF [N]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/F_zF[N]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'F zF [N]', 'LineWidth', 2.1);
title('Vertical force on Front tyre');
legend('Location','northwest');
xlabel('Time [s]');

subplot 212
hold on, grid on, box on
ylabel('F zR [N]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/F_zR[N]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'F zR [N]', 'LineWidth', 2.1);
title('Vertical force on Rear tyre');
legend('Location','northwest');
xlabel('Time [s]');

saveas(gcf, 'simX_fz.png');