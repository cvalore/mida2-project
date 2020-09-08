syms Vx s Cf Cr Jz lf lr m
%%
A = [   -(Cf+Cr)/(m*Vx) ((Cr*lr-Cf*lf)/(m*Vx))-Vx 0 0
        (Cr*lr - Cf*lf)/(Jz*Vx) -(Cf*lf^2 + Cr*lr^2)/(Jz*Vx) 0 0
        0   1   0   0
        1   0   Vx 0];
    
B = [   Cf/m 0
        Cf*lf/Jz 0
        0   -Vx
        0 0];
    
C = [   0 0 0 1];

D = 0;
%%
modelTF = C*inv(s*eye(4) - A)*B + D;
modelTF_simpl = simplify(modelTF);
Ns = Cf*Vx^2*Jz*s^2 + Cf*Vx*(Cr*lr^2 + Cr*lf*lr)*s + Cf*Vx*(Cr*Vx*lr  + Cr*Vx*lf);
Ds1 = s^2;
Ds2 = Jz*Vx^2*m*s^2 + (Cf*Jz*Vx + Cr*Jz*Vx + Cf*Vx*lf^2*m + Cr*Vx*lr^2*m)*s + Cf*Cr*(lf+lr)^2 - Cf*Vx^2*lf*m + Cr*Vx^2*lr*m;
%Grhos = -(Vx^2*s + Vx^2*k)/(k*s^2);

%% our param
m = 590+70+58;
Cf = 100000;
Cr = 110000;
Jz = 606;
lf = 1.767;
lr = 1.353;

%% rescheduling
%1Gs_2 = Ns * s^2 / (Ds1 * Ds2);
% s = 0
% Gs_2_0 = simplify(subs(Gs_2))
% k_sched = ((Cf*Cr*Vx^2*(lf + lr))/(- Cf*m*Vx^2*lf + Cr*m*Vx^2*lr + Cf*Cr*lf^2 + 2*Cf*Cr*lf*lr + Cf*Cr*lr^2))^-1;
% Grho_0 = -Vx^2;
% C0 = simplify(-k_sched * Grho_0)
%%
% Vx = 50;
% k_50 = subs(k_sched);

%% Vx 45
Vx = 45;
N45 = subs(Ns);
D1_45 = subs(Ds1);
D2_45 = subs(Ds2);

modelTF_45 = N45/(D1_45 * D2_45);
modelTF_45_tf = tf([122715000000 2089573200000 69498000000000], [881093700 223209832059/10 66556813500 0 0]);

% k_45 = subs(k_sched);

%% Vx 50
Vx = 50;
N50 = subs(Ns);
D1_50 = subs(Ds1);
D2_50 = subs(Ds2);

modelTF_50 = N50/(D1_50 * D2_50);
modelTF_50_tf = tf([151500000000 2321748000000 85800000000000], [1087770000 24801092451 57051750000 0 0]);

%% Vx 55
Vx = 55;
N55 = subs(Ns);
D1_55 = subs(Ds1);
D2_55 = subs(Ds2);

modelTF_55 = N55/(D1_55 * D2_55);
modelTF_55_tf = tf([183315000000 2553922800000 103818000000000], [1316201700 272812016961/10 46546153500 0 0]);

% k_55 = subs(k_sched);

%% Vx 60
Vx = 60;
N60 = subs(Ns);
D1_60 = subs(Ds1);
D2_60 = subs(Ds2);

modelTF_60 = N60/(D1_60 * D2_60);
modelTF_60_tf = tf([218160000000 2786097600000 123552000000000], [1566388800 148806554706/5 35040024000 0 0]);

% k_60 = subs(k_sched);

%% Vx 65
Vx = 65;
N65 = subs(Ns);
D1_65 = subs(Ds1);
D2_65 = subs(Ds2);

modelTF_65 = N65/(D1_65 * D2_65);
modelTF_65_tf = tf([256035000000 3018272400000 145002000000000], [1838331300 322414201863/10 22533361500 0 0]);

% k_65 = subs(k_sched);
%% Vx 70
Vx = 70;
N70 = subs(Ns);
D1_70 = subs(Ds1);
D2_70 = subs(Ds2);

modelTF_70 = N70/(D1_70 * D2_70);
modelTF_70_tf = tf([296940000000 3250447200000 168168000000000], [2132029200 173607647157/5 9026166000 0 0]);

% k_70 = subs(k_sched);
%%
figure(1)
hold on
legend
models = [modelTF_45_tf modelTF_50_tf modelTF_55_tf modelTF_60_tf modelTF_65_tf modelTF_70_tf];
for i = 1:size(models, 2)
   bode(models(1,i));
end

%%

% Reg = tf([22877 560807 1866260 2969130 1641620], [1 1121.93 629649 9119350 315994130 0]);
Reg = tf([31.831 3.99988 0.125656], [1 12.57 0]); % doppio zero in 0.01 Hz, polo in 0 e 2Hz, gain 0.01

%%
% RegMori = tf([0.63662 0.0799977 0.00251313], [1 12.57 0]);
% RegPart2 = tf([0.25], [1]);
% Reg = RegMori * RegPart2;% * [double(k_45)/double(k_50) double(k_50)/double(k_50) double(k_55)/double(k_50)];

% Reg = tf([35.708 4.4885 0.140975], [1 197.07 2319.17 0]);
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
%%

