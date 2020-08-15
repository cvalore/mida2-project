clc

hold on, box on, grid on
axis equal

model = 'Model2';

plot(out.logsout.find('BlockPath', strcat(model, '/x_pos[m]')).getElement(1).Values(:,1).Data, ...
     out.logsout.find('BlockPath', strcat(model, '/y_pos[m]')).getElement(1).Values(:,1).Data, ...
     'b-', 'LineWidth', 1.25);

for i=1:5:size(out.debugTest_index.Data, 1)
   hold on
   vectarrow([out.debugTest_virtualX.Data(i), out.debugTest_virtualY.Data(i)], ...
       [trajec(2, out.debugTest_index.Data(i)), trajec(3, out.debugTest_index.Data(i))], ...
       1.75);
end

hold on
plot(trajec(2,:), trajec(3,:), 'r--');