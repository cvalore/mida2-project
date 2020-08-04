clear 
close all

%% Steering wheel
swa         = [0,20,40,60,80,100,120,140,160,200];
inner_rwa   = [0,2,4,6,8,10,12,14,16,20];
outer_rwa   = [0,2,4,6,8,10,12,14.426,17.221,23.64];

figure
hold on, grid on, box on
plot(swa,inner_rwa)
plot(swa,outer_rwa)
xlabel('Steering wheel angle [deg]')
ylabel('Road-wheel angle [deg]')
legend('Inner wheel','Outer wheel')
