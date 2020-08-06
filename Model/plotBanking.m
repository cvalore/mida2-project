clc

load('banking_indy');

figure(1);
subplot 311
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,1:5001));
title('Banking funzione dell ascissa curvilinea 0 - 500 m');

figure(1)
subplot 312
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,5002:10001));
title('Banking funzione dell ascissa curvilinea 501 - 1000 m');

figure(1)
subplot 313
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,10002:15001));
title('Banking funzione dell ascissa curvilinea 1001 - 1500 m');

figure(2)
subplot 311
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,15002:20001));
title('Banking funzione dell ascissa curvilinea 1501 - 2000 m');

figure(2)
subplot 312
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,20002:25001));
title('Banking funzione dell ascissa curvilinea 2001 - 2500 m');

figure(2)
subplot 313
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,25002:30001));
title('Banking funzione dell ascissa curvilinea 2501 - 3000 m');

figure(3)
subplot 311
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,30002:35001));
title('Banking funzione dell ascissa curvilinea 3001 - 3500 m');

figure(3)
subplot 312
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,35002:40001));
title('Banking funzione dell ascissa curvilinea 3501 - 4000 m');

figure(3)
subplot 313
hold on, grid on, box on
xlabel('Ascissa curvilinea [dm]');
ylabel('Banking [deg]');
plot(banking_indy(:,40002:40234));
title('Banking funzione dell ascissa curvilinea 4001 - 4023.3 m');