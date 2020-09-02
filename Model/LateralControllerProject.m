syms Vx s Cf Cr Jz lf lr m

Ns = Cf*Jz*Vx*s^2 + (Cf*Cr*lr^2 + Cf*Cr*lf*lr)*s + Cf*Cr*(lr+lf)*Vx;
Ds = Jz*m*Vx^2*s^2 + ((Cf+Cr)*Jz + (Cf*lf^2 + Cr*lr^2)*m)*Vx*s + Cf*Cr*(lf+lr)^2+(Cr*lr - Cf*lf)*m*Vx^2;

Gs = (Vx/s^2) * (Ns/Ds);

%%
m = 590+70+58;
Cf = 100000;
Cr = 100000;
Jz = 606;
lf = 1.767;
lr = 1.353;
Vx = 55;

%%
G = subs(Gs)
G_TF = tf([55*3333000000 55*42213600000 55*1716000000000], [1316201700 26224994202 7425270000 0 0])