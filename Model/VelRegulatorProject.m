mT = 590 + 70 + 58;
%%
Fx2Vel = tf([1/mT], [1 0])
figure(1)
optsFx2Vel = bodeoptions('cstprefs');
optsFx2Vel.FreqUnits = 'Hz';
optsFx2Vel.Title.String = 'Fx to Vel transfer function - Bode diagram';
optsFx2Vel.Grid = 'on';
bode(Fx2Vel, optsFx2Vel)
%%
Reg = tf([6500], [1 0]) * tf([1 0.8 0.16], [1 0.2])
OpenLoopTF = Reg * Fx2Vel
hold on;
bode(OpenLoopTF, optsFx2Vel)
%%
sys = (OpenLoopTF / (1 + OpenLoopTF));
t = linspace(0, 100, 1000);
u = sin(0.3*t);                                     
y = lsim(sys, u, t); 
figure(2)
xlabel('Time [s]')
ylabel('Amplitude [m]')
title('Sine wave system response')
hold on;
legend
plot(t, u, 'r--', 'LineWidth', 2.5, 'DisplayName', 'Ref')
plot(t, y, 'b-', 'LineWidth', 1.25, 'DisplayName', 'Response')