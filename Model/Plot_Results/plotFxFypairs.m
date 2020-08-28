function plotFxFypairs(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 211
hold on, grid on, box on
ylabel('F yF [N]');

F_xF = out.logsout.find('BlockPath', strcat(model, '/F_xF[N]')).getElement(1).Values(:,1).Data;
F_yF = out.logsout.find('BlockPath', strcat(model, '/F_yF[N]')).getElement(1).Values(:,1).Data;
for i=1:20:size(out.tout, 1)
    scatter(F_xF(i), F_yF(i), 15);
end

F_xmaxF = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/F_xmaxF2')).getElement(1).Values(:,1).Data;
F_ymaxF = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/Calculate Peak F')).getElement(1).Values(:,1).Data;
x_min = -max(F_xmaxF)-100;
x_max = +max(F_xmaxF)+100;
y_min = -max(F_ymaxF)-100;
y_max = +max(F_ymaxF)+100;
xlim([x_min, x_max]);
ylim([y_min, y_max])
for i=1:200:size(F_xmaxF, 1)
    x = [-F_xmaxF(i):F_xmaxF(i)];
    plot(x, F_ymaxF(i)*sqrt(1-(x/F_xmaxF(i)).^2), 'r-');
    plot(x, -F_ymaxF(i)*sqrt(1-(x/F_xmaxF(i)).^2), 'r-');
end
title('Front tyre ellipse / forces');
xlabel('F xF [N]');


subplot 212
hold on, grid on, box on
ylabel('F yR [N]');

F_xR = out.logsout.find('BlockPath', strcat(model, '/F_xR[N]')).getElement(1).Values(:,1).Data;
F_yR = out.logsout.find('BlockPath', strcat(model, '/F_yR[N]')).getElement(1).Values(:,1).Data;
for i=1:20:size(out.tout, 1)
    scatter(F_xR(i), F_yR(i), 15);
end

F_xmaxR = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/F_xmaxR2')).getElement(1).Values(:,1).Data;
F_ymaxR = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/Calculate Peak R')).getElement(1).Values(:,1).Data;
x_min = -max(F_xmaxR)-100;
x_max = +max(F_xmaxR)+100;
y_min = -max(F_ymaxR)-100;
y_max = +max(F_ymaxR)+100;
xlim([x_min, x_max]);
ylim([y_min, y_max])
for i=1:200:size(F_xmaxR, 1)
    x = [-F_xmaxR(i):F_xmaxR(i)];
    plot(x, F_ymaxR(i)*sqrt(1-(x/F_xmaxR(i)).^2), 'r-');
    plot(x, -F_ymaxR(i)*sqrt(1-(x/F_xmaxR(i)).^2), 'r-');
end
title('Rear tyre ellipse / forces');
xlabel('F xR [N]');
% 
% saveas(gcf, 'simX_force-ellipse.png');
