clc
close all

load('x_indy_internal');
load('y_indy_internal');

figure(1);
% subplot 311
hold on, grid on, box on
axis equal
% xlabel('Ascissa curvilinea [dm]');
% ylabel('Banking [deg]');
plot(x_indy_internal, y_indy_internal);
plot(x_indy_internal(1,1), y_indy_internal(1,1), 'r*', 'LineWidth', 8);
%plot(x_indy_internal(1,1:1000), y_indy_internal(1,1:1000), 'r-', 'LineWidth', 2.5);
quiver(x_indy_internal(1,1), y_indy_internal(1,1), ...
    x_indy_internal(1,2000)-x_indy_internal(1,1), ...
    y_indy_internal(1,2000)-y_indy_internal(1,1), ...
    'r-', 'LineWidth', 2.5, 'MaxHeadSize', 50);
% title('Banking funzione dell ascissa curvilinea 0 - 500 m');