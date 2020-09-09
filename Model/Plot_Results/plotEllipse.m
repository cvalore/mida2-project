function plotEllipse(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
subplot 211
hold on, grid on, box on
ylabel('F yF [kN]');
F_xmaxF = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/F_xmaxF2')).getElement(1).Values(:,1).Data;
F_ymaxF = out.logsout.find('Name', 'FymaxF').getElement(1).Values(:,1).Data;
indexes = find(F_ymaxF > 0);
indexes = [indexes(1), indexes(size(indexes,1))]';
F_xmaxF = F_xmaxF(indexes) / 1000;
F_ymaxF = F_ymaxF(indexes);
x_min = -max(F_xmaxF)-1;
x_max = +max(F_xmaxF)+1;
y_min = -max(F_ymaxF)-1;
y_max = +max(F_ymaxF)+1;
xlim([x_min, x_max]);
ylim([y_min, y_max])

for i=1:size(indexes, 1)
    x = linspace(-F_xmaxF(i), F_xmaxF(i), 1000)';
    plot(x, F_ymaxF(i)*sqrt(1-(x/F_xmaxF(i)).^2), 'r-')
    plot(x, -F_ymaxF(i)*sqrt(1-(x/F_xmaxF(i)).^2), 'r-') 
end

title('Front tyre ellipse / forces');
xlabel('F xF [kN]');


subplot 212
hold on, grid on, box on
ylabel('F yR [kN]');
F_xmaxR = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/F_xmaxR2')).getElement(1).Values(:,1).Data;
F_ymaxR = out.logsout.find('Name', 'FymaxR').getElement(1).Values(:,1).Data;
indexes = find(F_ymaxR > 0);
indexes = [indexes(1), indexes(size(indexes,1))]';
F_xmaxR = F_xmaxR(indexes) / 1000;
F_ymaxR = F_ymaxR(indexes);
x_min = -max(F_xmaxR)-1;
x_max = +max(F_xmaxR)+1;
y_min = -max(F_ymaxR)-1;
y_max = +max(F_ymaxR)+1;
xlim([x_min, x_max]);
ylim([y_min, y_max])


for i=1:size(indexes, 1)
    x = linspace(-F_xmaxR(i), F_xmaxR(i), 1000)';
    plot(x, F_ymaxR(i)*sqrt(1-(x/F_xmaxR(i)).^2), 'r-')
    plot(x, -F_ymaxR(i)*sqrt(1-(x/F_xmaxR(i)).^2), 'r-') 
end

title('Rear tyre ellipse / forces');
xlabel('F xR [kN]');
% 
% saveas(gcf, 'simX_ellipses_wear.png');
