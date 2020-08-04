clear 
close all

%% Front suspension
% Damper
zdot      = [0,0.01,0.02,0.04,0.06,0.09,0.125,0.175,0.225,0.3];
Fbump     = [0,638,1749,2981,3740,4477,5038,5676,6237,7040];
Frebound  = [0,1595,3905,7931,9856,11572,13002,14509,15532,16775];

% figure
% hold on, grid on, box on
% plot(zdot*1000,Fbump)
% plot(-zdot*1000,-Frebound)
% xlabel('Speed [mm/s]')
% ylabel('Damper force [N]')

% Spring
z        = [0,0.035];
Fspring  = [0,6000];
Kspring  = 	Fspring(2)/z(2);

figure
subplot 211
title('Front suspension - Spring')
hold on, grid on, box on
plot(z*1000,Fspring,'k')
plot(-z*1000,-Fspring,'k')
xlabel('Travel [mm]')
ylabel('Spring force [N]')
subplot 212
title('Front suspension - Damper')
hold on, grid on, box on
plot(zdot*1000,Fbump)
plot(-zdot*1000,-Frebound)
xlabel('Speed [mm/s]')
ylabel('Damper force [N]')

%% Rear suspension
% Damper
zdot      = [0,0.01,0.02,0.04,0.06,0.09,0.125,0.175,0.225,0.3];
Fbump     = [0,1330,3180,5530,6560,7630,8430,9220,9880,10780];
Frebound  = [0,1060,2820,5060,6540,8190,9650,11050,12120,13460];
Frebound_wrong = [18,36,72,132,192,1152,12000,36000,0,0];

% figure
% hold on, grid on, box on
% plot(zdot*1000,Fbump)
% plot(-zdot*1000,-Frebound)
% xlabel('Speed [mm/s]')
% ylabel('Damper force [N]')

% Spring
z        = [0,0.035];
Fspring  = [0,5100];
Kspring  = 	Fspring(2)/z(2);

figure
subplot 211
title('Rear suspension - Spring')
hold on, grid on, box on
plot(z*1000,Fspring,'k')
plot(-z*1000,-Fspring,'k')
xlabel('Travel [mm]')
ylabel('Spring force [N]')
subplot 212
title('Rear suspension - Damper')
hold on, grid on, box on
plot(zdot*1000,Fbump)
plot(-zdot*1000,-Frebound)
plot(-zdot*1000,-Frebound_wrong)
xlabel('Speed [mm/s]')
ylabel('Damper force [N]')

