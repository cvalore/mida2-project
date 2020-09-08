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
Cr = 110000;
Jz = 606;
lf = 1.767;
lr = 1.353;
k = 3;

%% rescheduling
% Gs_2 = Ns * s^2 / (Ds1 * Ds2);
% s = 0
% Gs_2_0 = simplify(subs(Gs_2))
k_sched = ((Cf*Cr*Vx^2*(lf + lr))/(- Cf*m*Vx^2*lf + Cr*m*Vx^2*lr + Cf*Cr*lf^2 + 2*Cf*Cr*lf*lr + Cf*Cr*lr^2))^-1;
Grho_0 = -Vx^2;
C0 = simplify(-k_sched * Grho_0);
%%
Vx = 50;
k_50 = subs(k_sched);

%% Vx 45
Vx = 45;
N45 = subs(Ns);
D1_45 = subs(Ds1);
D2_45 = subs(Ds2);

modelTF_45 = N45/(D1_45 * D2_45);
modelTF_45_tf = tf([11929228425000 75766719600000 208494000000000], [881093700*3 223209832059*3/10 66556813500*3 0 0])

k_45 = subs(k_sched);

%% Vx 50
Vx = 50;
N50 = subs(Ns);
D1_50 = subs(Ds1);
D2_50 = subs(Ds2);

modelTF_50 = N50/(D1_50 * D2_50);
modelTF_50_tf = tf([16313325000000 92765244000000 257400000000000], [1087770000*3 24801092451*3 57051750000*3 0 0])

%% Vx 55
Vx = 55;
N55 = subs(Ns);
D1_55 = subs(Ds1);
D2_55 = subs(Ds2);

modelTF_55 = N55/(D1_55 * D2_55);
modelTF_55_tf = tf([21658041075000 111479768400000 311454000000000], [1316201700*3 272812016961*3/10 46546153500*3 0 0])

k_55 = subs(k_sched);

%% Vx 60
Vx = 60;
N60 = subs(Ns);
D1_60 = subs(Ds1);
D2_60 = subs(Ds2);

modelTF_60 = N60/(D1_60 * D2_60);
modelTF_60_tf = tf([28058529600000 131910292800000 370656000000000], [1566388800*3 148806554706*3/5 35040024000*3 0 0])

k_60 = subs(k_sched);

%% Vx 65
Vx = 65;
N65 = subs(Ns);
D1_65 = subs(Ds1);
D2_65 = subs(Ds2);

modelTF_65 = N65/(D1_65 * D2_65);
modelTF_65_tf = tf([35609943525000 154056817200000 435006000000000], [1838331300*3 322414201863*3/10 22533361500*3 0 0])

k_65 = subs(k_sched);
%% Vx 70
Vx = 70;
N70 = subs(Ns);
D1_70 = subs(Ds1);
D2_70 = subs(Ds2);

modelTF_70 = N70/(D1_70 * D2_70);
modelTF_70_tf = tf([44407435800000 177919341600000 504504000000000], [2132029200*3 173607647157*3/5 9026166000*3 0 0])

k_70 = subs(k_sched);
%%
figure(1)
hold on
legend
models = [modelTF_45_tf modelTF_50_tf modelTF_55_tf modelTF_60_tf modelTF_65_tf modelTF_70_tf];
for i = 1:size(models, 2)
   bode(models(1,i));
end
%%
% RegMori = tf([0.63662 0.0799977 0.00251313], [1 12.57 0]);
% RegPart2 = tf([0.25], [1]);
% Reg = RegMori * RegPart2;% * [double(k_45)/double(k_50) double(k_50)/double(k_50) double(k_55)/double(k_50)];


% usato in model 12
Reg = tf(1.5*[35.708 4.4885 0.140975], [1 197.07 2319.17 0]); %doppio zero in 0.01, polo in 0 e 2, polo in 29.4 per smorzare rumore, gain 6*10-5

% usato in model 14
% Reg = tf([0.3852 0.0484 0.0016], [1 12.57 0]);

% Reg = tf([0.041667], [1]) * tf([1 0.06], [1 0]) * tf([1 0.06], [1 2.5]);
%%
figure(2)
hold on
legend
% bode(Reg * modelTF_45_tf);
% bode(Reg * modelTF_50_tf);
% bode(Reg * modelTF_55_tf);
% bode(Reg * double(k_45)/double(k_50) * modelTF_45_tf);
% bode(Reg * double(k_50)/double(k_50) * modelTF_50_tf);
% bode(Reg * double(k_55)/double(k_50) * modelTF_55_tf);
% models = [modelTF_45_tf modelTF_50_tf modelTF_55_tf modelTF_60_tf modelTF_65_tf modelTF_70_tf];
for i = 1:size(models, 2)
   bode(Reg * models(1,i));
end
figure(3)
hold on
for i = 1:size(models, 2)
   step((Reg * models(1,i))/(1 + Reg * models(1,i)));
end
% bode(Reg * double(k_60/k_50) * modelTF_60_tf);
% bode(Reg * double(k_65/k_50) * modelTF_65_tf);
% bode(Reg * double(k_70/k_50) * modelTF_70_tf);

