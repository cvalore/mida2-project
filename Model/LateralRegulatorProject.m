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
%% Vx 45
Vx = 45;
N45 = subs(Ns);
D1_45 = subs(Ds1);
D2_45 = subs(Ds2);

modelTF_45 = N45/(D1_45 * D2_45);
modelTF_45_tf = tf([11929228425000 82654603200000 227448000000000], [881093700*3 115925764869*3/5 95963157000*3 0 0], 'Name', 'vel 45 m/s');

%% Vx 50
Vx = 50;
N50 = subs(Ns);
D1_50 = subs(Ds1);
D2_50 = subs(Ds2);

modelTF_50 = N50/(D1_50 * D2_50);
modelTF_50_tf = tf([16313325000000 101198448000000 280800000000000], [1087770000*3 25761281082*3 91072500000*3 0 0], 'Name', 'vel 50 m/s');

%% Vx 55
Vx = 55;
N55 = subs(Ns);
D1_55 = subs(Ds1);
D2_55 = subs(Ds2);

modelTF_55 = N55/(D1_55 * D2_55);
modelTF_55_tf = tf([21658041075000 121614292800000 339768000000000], [1316201700*3 141687045951*3/5 85667037000*3 0 0], 'Name', 'vel 55 m/s');

%% Vx 60
Vx = 60;
N60 = subs(Ns);
D1_60 = subs(Ds1);
D2_60 = subs(Ds2);

modelTF_60 = N60/(D1_60 * D2_60);
modelTF_60_tf = tf([28058529600000 143902137600000 404352000000000], [1566388800*3 154567686492*3/5 79746768000*3 0 0], 'Name', 'vel 60 m/s');

%% Vx 65
Vx = 65;
N65 = subs(Ns);
D1_65 = subs(Ds1);
D2_65 = subs(Ds2);

modelTF_65 = N65/(D1_65 * D2_65);
modelTF_65_tf = tf([35609943525000 168061982400000 474552000000000], [1838331300*3 167448327033*3/5 73311693000*3 0 0], 'Name', 'vel 65 m/s');

%% Vx 70
Vx = 70;
N70 = subs(Ns);
D1_70 = subs(Ds1);
D2_70 = subs(Ds2);

modelTF_70 = N70/(D1_70 * D2_70);
modelTF_70_tf = tf([44407435800000 194093827200000 550368000000000], [2132029200*3 180328967574*3/5 66361812000*3 0 0], 'Name', 'vel 70 m/s');

%%
figure(1)
hold on
legend
vel = [45 50 55 60 65 70 75];
models = [modelTF_45_tf modelTF_50_tf modelTF_55_tf modelTF_60_tf modelTF_65_tf modelTF_70_tf];
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

