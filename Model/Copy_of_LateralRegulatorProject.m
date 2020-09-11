syms Vx s Cf Cr Jz lf lr m k
%%
A = [   -(Cf+Cr)/(m*Vx) ((Cr*lr-Cf*lf)/(m*Vx))-Vx 0 0
        (Cr*lr - Cf*lf)/(Jz*Vx) -(Cf*lf^2 + Cr*lr^2)/(Jz*Vx) 0 0
        0   1   0   0
        1   0   Vx 0];
    
B = [   Cf/m 0
        Cf*lf/Jz 0
        0   -Vx
        0 0];
    
C = [   0 0 Vx/k 1];

D = 0;
%%
modelTF = C*inv(s*eye(4) - A)*B + D;
modelTF_simpl = simplify(modelTF);
Ns = Cf*Vx*(lf*m*Vx^2 + Jz*k*Vx)*s^2 + Cf*Vx*(Cr*Vx*lr + Cr*lf*Vx + Cr*k*lr^2 + Cr*k*lf*lr)*s + Cf*Vx*(Cr*k*Vx*lr + Cr*k*lf*Vx);
Ds1 = k*s^2;
Ds2 = Jz*Vx^2*m*s^2 + (Cf*Jz*Vx + Cr*Jz*Vx + Cf*Vx*lf^2*m + Cr*Vx*lr^2*m)*s + Cf*Cr*lf^2 + Cf*Cr*lr^2 - Cf*Vx^2*lf*m + Cr*Vx^2*lr*m + 2*Cf*Cr*lf*lr;

Grhos = -(Vx^2*s + Vx^2*k)/(k*s^2);

%% our param
m = 590+70+58;
Cf = 100000;
Cr = 120000;
Jz = 606;
lf = 1.767;
lr = 1.353;
k = 3;

%% rescheduling
Grho_0 = -Vx^2;
C0 = simplify(-((Cf*Cr*Vx^2*(lf + lr))/(- Cf*m*Vx^2*lf + Cr*m*Vx^2*lr + Cf*Cr*lf^2 + 2*Cf*Cr*lf*lr + Cf*Cr*lr^2))^-1 * Grho_0);
%% Vx 75
Vx = 75;
N75 = subs(Ns);
D1_75 = subs(Ds1);
D2_75 = subs(Ds2);

modelTF_75 = N75/(D1_75 * D2_75);
modelTF_75_tf = tf([54546159375000 221997672000000 631800000000000], [2447482500*3 38641921623*3 58897125000*3 0 0], 'Name', 'vel 75 m/s');

%% Vx 80
Vx = 80;
N80 = subs(Ns);
D1_80 = subs(Ds1);
D2_80 = subs(Ds2);

modelTF_80 = N80/(D1_80 * D2_80);
modelTF_80_tf = tf([66121267200000 251773516800000 718848000000000], [2784691200*3 206090248656*3/5 50917632000*3 0 0], 'Name', 'vel 80 m/s');

%% Vx 85
Vx = 85;
N85 = subs(Ns);
D1_85 = subs(Ds1);
D2_85 = subs(Ds2);

modelTF_85 = N85/(D1_85 * D2_85);
modelTF_85_tf = tf([79227912225000 283421361600000 811512000000000], [3143655300*3 218970889197*3/5 42423333000*3 0 0], 'Name', 'vel 85 m/s');

%%
figure(1)
hold on
legend
vel = [75 80 85];
models = [modelTF_75_tf modelTF_80_tf modelTF_85_tf];
for i = 1:size(models, 2)
   bode(models(1,i));
end
%%
% usato in model 12
% Reg = tf([35.708 4.4885 0.140975], [1 197.07 2319.17 0]); %doppio zero in 0.01, polo in 0 e 2, polo in 29.4 per smorzare rumore, gain 6*10-5

% usato in model 3 senza doppio integratore (gain 2*10-4, polo 2 Hz, zeri 0.01 Hz
% Reg = tf(1.5*[0.3852 0.0484 0.0016], [1 12.57 0]);

% usato in model 3 con doppio integratore e polo aggiuntivo
% Reg = tf([3.0396 0.381956 0.0119992], [1 100 0 0]);

% usato in model 3 con doppio integratore, zeri in 0.01 Hz gain 1.2*10^-4
Reg = tf([0.030394 0.00381931 0.000119984], [1 0 0], 'Name', 'Regulator');

% Reg = tf([0.016465 0.00206899 0.0000649974], [1 0 0], 'Name', 'Regulator');
%%
figure(2)
hold on
legend
for i = 1:size(models, 2)
   bode(Reg * models(1,i));
end
figure(3)
hold on
for i = 1:size(models, 2)
   step((Reg * models(1,i))/(1 + Reg * models(1,i)));
end

