function plotEllipse(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 211
hold on, grid on, box on
ylabel('F yF [N]');
F_xmaxF = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/F_xmaxF2')).getElement(1).Values(:,1).Data;
F_ymaxF = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/Calculate Peak F')).getElement(1).Values(:,1).Data;
x_min = -max(F_xmaxF)-100;
x_max = +max(F_xmaxF)+100;
y_min = -max(F_ymaxF)-100;
y_max = +max(F_ymaxF)+100;
xlim([x_min, x_max]);
ylim([y_min, y_max])

x = [-F_xmaxF(1):F_xmaxF(1)];
plot(x, F_ymaxF(1)*sqrt(1-(x/F_xmaxF(1)).^2), 'r-');
plot(x, -F_ymaxF(1)*sqrt(1-(x/F_xmaxF(1)).^2), 'r-');

x = [-F_xmaxF(size(F_xmaxF,1)):F_xmaxF(size(F_xmaxF,1))];
plot(x, F_ymaxF(size(F_ymaxF,1))*sqrt(1-(x/F_xmaxF(size(F_xmaxF,1))).^2), 'r-');
plot(x, -F_ymaxF(size(F_ymaxF,1))*sqrt(1-(x/F_xmaxF(size(F_xmaxF,1))).^2), 'r-');

title('Front tyre ellipse / forces');
xlabel('F xF [N]');


subplot 212
hold on, grid on, box on
ylabel('F yR [N]');
F_xmaxR = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/F_xmaxR2')).getElement(1).Values(:,1).Data;
F_ymaxR = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/Calculate Peak R')).getElement(1).Values(:,1).Data;
x_min = -max(F_xmaxR)-100;
x_max = +max(F_xmaxR)+100;
y_min = -max(F_ymaxR)-100;
y_max = +max(F_ymaxR)+100;
xlim([x_min, x_max]);
ylim([y_min, y_max])

x = [-F_xmaxR(1):F_xmaxR(1)];
plot(x, F_ymaxR(1)*sqrt(1-(x/F_xmaxR(1)).^2), 'r-');
plot(x, -F_ymaxR(1)*sqrt(1-(x/F_xmaxR(1)).^2), 'r-');

x = [-F_xmaxR(size(F_xmaxR,1)):F_xmaxR(size(F_xmaxR,1))];
plot(x, F_ymaxR(size(F_ymaxR,1))*sqrt(1-(x/F_xmaxR(size(F_xmaxR,1))).^2), 'r-');
plot(x, -F_ymaxR(size(F_ymaxR,1))*sqrt(1-(x/F_xmaxR(size(F_xmaxR,1))).^2), 'r-');

title('Rear tyre ellipse / forces');
xlabel('F xR [N]');
% 
% saveas(gcf, 'simX_ellipses_wear.png');
