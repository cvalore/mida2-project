figure(6);
subplot 311
hold on, grid on, box on
ylabel('F xR [N]');
if size(out.logsout{1}.Values(:,1).Data, 1) < size(out.tout, 1)
    F_xR = zeros(1, size(out.tout, 1))+out.logsout{1}.Values.Data;
    plot(out.tout', F_xR, 'DisplayName', 'F xR [N]', 'LineWidth', 2.1);
else
    plot(out.tout', out.logsout{1}.Values.Data, 'DisplayName', 'F xR [N]', 'LineWidth', 2.1);
end
title('Longitudinal forces on Rear tyre');
legend('Location','northwest');
xlabel('Time [s]');

figure(6);
subplot 312
hold on, grid on, box on
yyaxis left
ylabel('F yF [N]');
plot(out.tout', out.logsout{2}.Values.Data, 'DisplayName', 'F yF [N]', 'LineWidth', 2.1);
yyaxis right
ylabel('F yR [N]');
plot(out.tout', out.logsout{3}.Values.Data, 'DisplayName', 'F yR [N]', 'LineWidth', 2.1)
title('Lateral forces on Front and Rear tyres');
legend('Location','northwest');
xlabel('Time [s]');

figure(6);
subplot 313
hold on, grid on, box on
yyaxis left
ylabel('Front wear [mm^3]');
plot(out.tout', out.logsout{6}.Values.Data, 'DisplayName', 'Front wear [mm^3]', 'LineWidth', 2.1);
yyaxis right
ylabel('Rear wear [mm^3]');
plot(out.tout', out.logsout{9}.Values.Data, 'DisplayName', 'Rear wear [mm^3]', 'LineWidth', 2.1)
title('Wear on Front and Rear tyres');
legend('Location','northwest');
xlabel('Time [s]');
