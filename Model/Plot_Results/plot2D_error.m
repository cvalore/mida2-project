function plot2D_error(model_index, out)

global trajec;

close all
clc

% hold on, box on, grid on
% figure('WindowState', 'maximized');

plotRes_2d(model_index, out);

for i=1:5:size(out.debugTest_index.Data, 1)
   hold on
   vectarrow([out.debugTest_virtualX.Data(i), out.debugTest_virtualY.Data(i)], ...
       [trajec(2, out.debugTest_index.Data(i)), trajec(3, out.debugTest_index.Data(i))], ...
       1.75);
end

hold on
plot(trajec(2,:), trajec(3,:), 'r--');