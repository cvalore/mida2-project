clc

syms Cf Cr m Vx lr lf Jz ...
    s ...
    
%     Vdoty r Fyr Fyf delta rdot Vy
% 
% eqs = [m*(Vdoty + r*Vx) == Fyr + Fyf*cos(delta), Jz*rdot == lf*Fyf*cos(delta) - lr*Fyr];
% sol = solve(eqs, [Vdoty rdot]);
% eq1 = simplify(sol.Vdoty);
% eq2 = simplify(sol.rdot);
% Fyr = -Cr*((Vy - r*lr)/(Vx));
% Fyf = -Cf*((Vy + r*lf)/(Vx) - delta);
% subs(eq1)
% subs(eq2)

% t = tf([(2*pi*4.1)^2], [1 0.203*(2*pi*4.1) (2*pi*4.1)^2], 'InputDelay', 0.08)
% bode(t)

%%

A = [-(Cf + Cr)/(m*Vx), -Vx+(Cr*lr - Cf*lf)/(m*Vx), 0, 0;
    (Cr*lr - Cf*lf)/(Jz*Vx), -(Cf*lf*lf + Cr*lr*lr)/(Jz*Vx), 0, 0;
    0, 1, 0, 0;
    1, 0, Vx, 0];

B = [Cf/m, 0;
    Cf*lf/Jz, 0;
    0, -Vx;
    0, 0];

C = [0, 0, 0, 1];

D = 0;

Phi=inv(s*eye(4)-A);

H=C*Phi*B+D;
H = simplify(H)

%% 
Cf = 100000;
Cr = 100000;
m = 590+58+70;
lf = 1.767;
lr = 1.353;
Jz = 606;
Vx_all = [45 50 55 60 65 70];
Vx = 55;
%%
% Cf = 155000;
% Cr = 205000;
% m = 2602;
% lf = 1.522;
% lr = 1.443;
% Jz = 2700;
% Vx_all = [30 45 60 75 90 105 120]/3.6;
% Vx = 60/3.6;
%%
for i=1:size(Vx_all, 2)
    A2 = double(subs(A));
    B2 = double(subs(B));
    C2 = double(subs(C));
    D2 = double(subs(D));

    model2SS = ss(A2, B2, C2, D2)
    [num2, den2] = ss2tf(model2SS.A, model2SS.B, model2SS.C, model2SS.D, 1);
%     [num3, den3] = ss2tf(model2SS.A, model2SS.B, model2SS.C, model2SS.D, 2);
    model2TF = tf(num2, den2)
    hold on, grid on, box on;
    bode(model2TF)
    h = gcr;
    setoptions(h,'FreqUnits','Hz')
    legend(strcat(strcat('vel', int2str(Vx_all(1,1)*3.6)), 'km/h'), ...
        strcat(strcat('vel', int2str(Vx_all(1,2)*3.6)), 'km/h'), ...
        strcat(strcat('vel', int2str(Vx_all(1,3)*3.6)), 'km/h'), ...
        strcat(strcat('vel', int2str(Vx_all(1,4)*3.6)), 'km/h'), ...
        strcat(strcat('vel', int2str(Vx_all(1,5)*3.6)), 'km/h'), ...
        strcat(strcat('vel', int2str(Vx_all(1,6)*3.6)), 'km/h'));
end

%%
A2 = double(subs(A));
B2 = double(subs(B));
C2 = double(subs(C));
D2 = double(subs(D));

model2SS = ss(A2, B2, C2, D2)   
[num2, den2] = ss2tf(model2SS.A, model2SS.B, model2SS.C, model2SS.D, 1);
model2TF = tf(num2, den2)
hold on, grid on, box on;
bode(model2TF)

%% prova per vedere sua step resp
Cf = 155000;
Cr = 205000;
m = 2602;
lf = 1.522;
lr = 1.443;
Jz = 2700;
Vx = 60/3.6;

AGecgSS = double(subs(A));
BGecgSS = double(subs(B));
CGecgSS = double(subs(C));
DGecgSS = double(subs(D));

GecgSS = ss(AGecgSS, BGecgSS, CGecgSS, DGecgSS)   
[numGecgTf, denGecgTf] = ss2tf(GecgSS.A, GecgSS.B, GecgSS.C, GecgSS.D, 1);

Gecg = tf(numGecgTf, denGecgTf)
Gsw = tf([(2*pi*4.1)^2],[1 0.203*2*pi*4.1 (2*pi*4.1)^2],'InputDelay', 0.08)
Reg = tf([0.0506606 0.0063662 0.0002], [1/(4*pi) 1 0])
Ls = Reg*Gsw*Gecg

%%

mine = tf([139.3 1764 7.171e04], [1 0.287 0 0 0])