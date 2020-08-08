clc

load('banking_indy');
load('s_indy_internal');

figure('WindowState', 'maximized')
subplot 311
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,1:5001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 0 - 500 m');

subplot 312
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,5002:10001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 501 - 1000 m');

subplot 313
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,10002:15001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 1001 - 1500 m');

saveas(gcf, 'banking1.png');

figure('WindowState', 'maximized')
subplot 311
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,15002:20001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 1501 - 2000 m');

subplot 312
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,20002:25001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 2001 - 2500 m');

subplot 313
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,25002:30001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 2501 - 3000 m');

saveas(gcf, 'banking2.png');

figure('WindowState', 'maximized')
subplot 311
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,30002:35001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 3001 - 3500 m');

subplot 312
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,35002:40001), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 3501 - 4000 m');

subplot 313
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,40002:40234), 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea 4001 - 4023.3 m');

saveas(gcf, 'banking3.png');

figure('WindowState', 'maximized')
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(s_indy_internal, banking_indy, 'LineWidth', 2);
title('Banking funzione dell ascissa curvilinea');

saveas(gcf, 'banking.png');