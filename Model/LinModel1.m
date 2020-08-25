clc
% syms    x1dot x2dot x3dot x4dot x5dot x6dot ...
syms    x1_ x2_ x3_ x4_ x5_ x6_ ...
        FxF_ FxR_ FyF_ FyR_ delta_ gamma_ ...
        x1 x2 x3 x4 x5 x6 ...
        FxF FxR FyF FyR delta gamma ...
        a b IT mT rho Cx S g ...
        vT0 x0 y0 ...
        alfaF alfaR alfaF_ alfaR_ ...
        KF KR
%% eqs   

%-0.5*rho*Cx*S*x4^2 + mT*g*sin(gamma)*sin(x5)

% + mT*g*sin(gamma)*cos(x5)

x1dot = @(x3, x4, x5) x4 * cos(x3 +x5);
x2dot = @(x3, x4, x5) x4 * sin(x3 +x5);
x3dot = @(x6) x6;
x4dot = @(FxF, FxR, FyF, FyR, x5, delta, x4, gamma) ...
    (FxF * cos(x5 - delta) + FxR * cos(x5) + FyF * sin (x5 - delta) + FyR * sin(x5) ...
                -0.5*rho*Cx*S*x4^2 + mT*g*sin(gamma)*sin(x5))/mT;
x5dot = @(FxF, FxR, FyF, FyR, x5, delta, x6, x4, gamma) ...
    (-FxF * sin(x5 - delta) - FxR * sin(x5) + FyF * cos (x5 - delta) + FyR * cos(x5) ...
                -mT*x4*x6 + mT*g*sin(gamma)*cos(x5))/(mT*x4);
x6dot = @(FxF, FyF, FyR, delta) ...
    (FxF*a*sin(delta) + FyF*a*cos(delta) - FyR * b)/IT;

alfaF = @(x4, x5, x6, delta) atan((x4*sin(x5)+a*x6)/(x4*cos(x5))) - delta;
alfaR = @(x4, x5, x6) atan((x4*sin(x5)-b*x6)/(x4*cos(x5)));

%% linearization
% @(x1, x2, x3, x4, x5, x6, FxF, FxR, FyF, FyR, delta, gamma)
grad = [ ...
    diff(x1dot, x1), diff(x1dot, x2), diff(x1dot, x3), diff(x1dot, x4), diff(x1dot, x5), diff(x1dot, x6), diff(x1dot, delta), diff(x1dot, FxF), diff(x1dot, FxR), diff(x1dot, FyF), diff(x1dot, FyR), diff(x1dot, gamma);...
    diff(x2dot, x1), diff(x2dot, x2), diff(x2dot, x3), diff(x2dot, x4), diff(x2dot, x5), diff(x2dot, x6), diff(x2dot, delta), diff(x2dot, FxF), diff(x2dot, FxR), diff(x2dot, FyF), diff(x2dot, FyR), diff(x2dot, gamma);...
    diff(x3dot, x1), diff(x3dot, x2), diff(x3dot, x3), diff(x3dot, x4), diff(x3dot, x5), diff(x3dot, x6), diff(x3dot, delta), diff(x3dot, FxF), diff(x3dot, FxR), diff(x3dot, FyF), diff(x3dot, FyR), diff(x3dot, gamma);...
    diff(x4dot, x1), diff(x4dot, x2), diff(x4dot, x3), diff(x4dot, x4), diff(x4dot, x5), diff(x4dot, x6), diff(x4dot, delta), diff(x4dot, FxF), diff(x4dot, FxR), diff(x4dot, FyF), diff(x4dot, FyR), diff(x4dot, gamma);...
    diff(x5dot, x1), diff(x5dot, x2), diff(x5dot, x3), diff(x5dot, x4), diff(x5dot, x5), diff(x5dot, x6), diff(x5dot, delta), diff(x5dot, FxF), diff(x5dot, FxR), diff(x5dot, FyF), diff(x5dot, FyR), diff(x5dot, gamma);...
    diff(x6dot, x1), diff(x6dot, x2), diff(x6dot, x3), diff(x6dot, x4), diff(x6dot, x5), diff(x6dot, x6), diff(x6dot, delta), diff(x6dot, FxF), diff(x6dot, FxR), diff(x6dot, FyF), diff(x6dot, FyR), diff(x6dot, gamma);...
];

gradSlip = [ ...
    diff(alfaF, x1), diff(alfaF, x2), diff(alfaF, x3), diff(alfaF, x4), diff(alfaF, x5), diff(alfaF, x6), diff(alfaF, delta), diff(alfaF, FxF), diff(alfaF, FxR), diff(alfaF, FyF), diff(alfaF, FyR), diff(alfaF, gamma);...
    diff(alfaR, x1), diff(alfaR, x2), diff(alfaR, x3), diff(alfaR, x4), diff(alfaR, x5), diff(alfaR, x6), diff(alfaR, delta), diff(alfaR, FxF), diff(alfaR, FxR), diff(alfaR, FyF), diff(alfaR, FyR), diff(alfaR, gamma);...
];

%% OP states
x1 = x0;
x2 = y0;
x3 = 0;
x4 = vT0;
x5 = 0;
x6 = 0;

%% OP inputs
delta = 0;
FxF = 0;
FxR = 0;
FyF = 0;
FyR = 0;
gamma = 0;

%% grad at OP
gradOP = subs(grad);
fOP = [x1dot(x3,x4,x5);x2dot(x3,x4,x5);x3dot(x6);x4dot(FxF, FxR, FyF, FyR, x5, delta, x4, gamma);x5dot(FxF, FxR, FyF, FyR, x5, delta, x6, x4, gamma);x6dot(FxF, FyF, FyR, delta)];
x = [x1_;x2_;x3_;x4_;x5_;x6_];
u = [delta_;FxF_;FxR_;FyF_;FyR_;gamma_];
xOP = [x1;x2;x3;x4;x5;x6];
uOP = [delta;FxF;FxR;FyF;FyR;gamma];

%% lin model
fLIN = fOP + gradOP * [x - xOP; u - uOP];

%% slips
gradSlipOP = subs(gradSlip);
slipsOP = [alfaF(x4, x5, x6, delta); alfaR(x4, x5, x6)];
slipsLIN = slipsOP + gradSlipOP * [x - xOP; u - uOP];

%% linear tyre model
alfaF = slipsLIN(1,1);
alfaR = slipsLIN(2,1);
FyF_ = -KF * alfaF;
FyR_ = -KR * alfaR;

%% final model
fLIN_final = subs(fLIN);
fLIN_final_simplified = simplify(fLIN_final);

x1dot = fLIN_final_simplified(1,1);
x2dot = fLIN_final_simplified(2,1);
x3dot = fLIN_final_simplified(3,1);
x4dot = fLIN_final_simplified(4,1);
x5dot = fLIN_final_simplified(5,1);
x6dot = fLIN_final_simplified(6,1);

m_fuel = 58; % [kg]  --------mass of the fuel
m_vehicle = 590; % [kg]  --------mass of only the vehicle
m_passenger = 70; % [kg]  --------mass of the passenger
mT = m_vehicle + m_fuel + m_passenger; % [kg]  --------total mass
g = 9.81; % [m/s^2]  --------gravity acceleration
a = 1.767; % [m]  --------distance betwen COG and front tyre
b = 1.353; % [m]  --------distance betwen COG and rear tyre
IT = 606; % [kg m^2]  --------moment of inertia of the body 
Cx = 0.725; % [-] --------longitudinal drag coefficient
rho_0 = 1.225; % [kg/m^3]   --------air density non-slipstream
Area = 1; % [m^2]   --------surface of vehicle on which the air goes through
KF = 70000; % [kg*m*rad^-1*s^-2]   --------front cornering stiffnes coefficient
KR = 70000; % [kg*m*rad^-1*s^-2]   --------rear cornering stiffnes coefficient
load banking_indy;
[roadS1, roadS2, roadS3, roadS4, curveRays, curveCenters, curveZ, zOffset, ...
    xMax, xMin, yMax, yMin, bankingAngle, longStraight, shortStraight, turn] = track3d(0);

% plot(out.tyre_alfa.Data, out.tyre_Fypaj1.Data, 'r--', out.tyre_alfa.Data, 70000*out.tyre_alfa.Data, 'b-'), xlim([-1,1]), ylim([-9000,9000])

