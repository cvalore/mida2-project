function plotForcesWear(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 311
hold on, grid on, box on
ylabel('F xR [N]');
if size(out.logsout{1}.Values(:,1).Data, 1) < size(out.tout, 1)
    F_xR = zeros(1, size(out.tout, 1))+out.logsout.find('BlockPath', strcat(model, '/F_xR[N]')).getElement(1).Values(:,1).Data;
    plot(out.tout', F_xR, 'DisplayName', 'F xR [N]', 'LineWidth', 2.1);
else
    plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/F_xR[N]')).getElement(1).Values(:,1).Data, ...
        'DisplayName', 'F xR [N]', 'LineWidth', 2.1);
end
title('Longitudinal forces on Rear tyre');
legend('Location','northwest');
xlabel('Time [s]');


subplot 312
hold on, grid on, box on
yyaxis left
ylabel('F yF [N]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/F_yF[N]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'F yF [N]', 'LineWidth', 2.1);
yyaxis right
ylabel('F yR [N]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/F_yR[N]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'F yR [N]', 'LineWidth', 2.1)
title('Lateral forces on Front and Rear tyres');
legend('Location','northwest');
xlabel('Time [s]');


subplot 313
hold on, grid on, box on
yyaxis left
ylabel('Front wear [mm^3]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/front_wear[m^3]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Front wear [mm^3]', 'LineWidth', 2.1);
yyaxis right
ylabel('Rear wear [mm^3]');
plot(out.tout', out.logsout.find('BlockPath', strcat(model, '/rear_wear[m^3]')).getElement(1).Values(:,1).Data, ...
    'DisplayName', 'Rear wear [mm^3]', 'LineWidth', 2.1)
title('Wear on Front and Rear tyres');
legend('Location','northwest');
xlabel('Time [s]');

saveas(gcf, 'simX_force-wear.png');
