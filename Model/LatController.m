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
Cr = 100000;
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
C0 = simplify(-k_sched * Grho_0)
%%
Vx = 50;
k_50 = subs(k_sched);

%% Vx 45
Vx = 45;
N45 = subs(Ns);
D1_45 = subs(Ds1);
D2_45 = subs(Ds2);

modelTF_45 = N45/(D1_45 * D2_45);
modelTF_45_tf = tf([11929228425000 68878836000000 189540000000000], [881093700*3 21456813438*3 37150470000*3 0 0])

k_45 = subs(k_sched);

%% Vx 50
Vx = 50;
N50 = subs(Ns);
D1_50 = subs(Ds1);
D2_50 = subs(Ds2);

modelTF_50 = N50/(D1_50 * D2_50);
modelTF_50_tf = tf([16313325000000 84332040000000 234000000000000], [1087770000*3 23840903820*3 23031000000*3 0 0])

%% Vx 55
Vx = 55;
N55 = subs(Ns);
D1_55 = subs(Ds1);
D2_55 = subs(Ds2);

modelTF_55 = N55/(D1_55 * D2_55);
modelTF_55_tf = tf([21658041075000 101345244000000 283140000000000], [1316201700*3 26224994202*3 7425270000*3 0 0])

k_55 = subs(k_sched);

%% Vx 60
Vx = 60;
N60 = subs(Ns);
D1_60 = subs(Ds1);
D2_60 = subs(Ds2);

modelTF_60 = N60/(D1_60 * D2_60);
modelTF_60_tf = tf([28058529600000 119918448000000 336960000000000], [1566388800*3 28609084584*3 -9666720000*3 0 0])

k_60 = subs(k_sched);

%% Vx 65
Vx = 65;
N65 = subs(Ns);
D1_65 = subs(Ds1);
D2_65 = subs(Ds2);

modelTF_65 = N65/(D1_65 * D2_65);
modelTF_65_tf = tf([35609943525000 140051652000000 395460000000000], [1838331300*3 30993174966*3 -28244970000*3 0 0])

k_65 = subs(k_sched);
%% Vx 70
Vx = 70;
N70 = subs(Ns);
D1_70 = subs(Ds1);
D2_70 = subs(Ds2);

modelTF_70 = N70/(D1_70 * D2_70);
modelTF_70_tf = tf([44407435800000 161744856000000 458640000000000], [2132029200*3 33377265348*3 -48309480000*3 0 0])

k_70 = subs(k_sched);
%%
RegMori = tf([0.63662 0.0799977 0.00251313], [1 12.57 0]);
RegPart2 = tf([0.1], [1]);
Reg = RegMori * RegPart2;
%%
hold on;
bode(Reg * modelTF_45_tf);
bode(Reg * modelTF_50_tf);
bode(Reg * modelTF_55_tf);
% bode(Reg * double(k_45/k_50) * modelTF_45_tf);
% bode(Reg * double(k_50/k_50) * modelTF_50_tf);
% bode(Reg * double(k_55/k_50) * modelTF_55_tf);
% bode(Reg * double(k_60/k_50) * modelTF_60_tf);
% bode(Reg * double(k_65/k_50) * modelTF_65_tf);
% bode(Reg * double(k_70/k_50) * modelTF_70_tf);
%%

