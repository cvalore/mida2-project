% X1 = 10;
% Y1 = 0;
% 
% X2 = [7, 13, 24, 50];
% Y2 = [0, 0, 0, 0];
% 
% x_d = (X1 - X2(1,1:3))
% y_d = (Y1 - Y2(1,1:3))
% sqrt(x_d.^2 + y_d.^2)


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