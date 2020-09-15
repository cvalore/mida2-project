function plotDistEllipse(model_index, out)

model = strcat('Model', int2str(model_index));

figure('WindowState', 'maximized')
hold on, grid on, box on
ylabel('Distance (0 far - 1 near) [-]');
distEllipse = out.logsout.find('BlockPath', strcat(model, '/DynamicModel/Banking1')).getElement(1).Values(:,1).Data;
xlim([0, out.tout(size(out.tout, 1))])
xlabel('Time [s]')
plot(out.tout', distEllipse)