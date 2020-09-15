global roadS1;
global roadS2;
global roadS3;
global roadS4;
% global curveRays;
global curveCenters;

%% Tyre setup
a0 = 1.47;       % [-]       --------Shape factor
a1 = 0;         % [1/kN]    --------Load influence on lateral friction coefficient (*1000)
a2 = 2050;      % [-]       --------Lateral friction coefficient (*1000)
a3 = 2500;      % [N/deg]   --------Change of stiffness with slip
a4 = 10;        % [kN]      --------Change of progressivity of stiffness / load
a5 = 0;         % [\%/deg/100]  --------Camber influence on stiffness
a6 = 0;         % [-]       --------Curvature change with load
a7 = -2;        % [-]       --------Curvature factor
a8 = 0;         % [deg/kN]  --------Load influence on horizontal shift
a9 = 0;         % [deg]     --------Horizontal shift at load = 0 and camber = 0
a10 = 0;        % [-]       --------Camber influence on horizontal shift
a11 = 0;        % [N]       --------Vertical shift
a12 = 0;        % [N]       --------Vertical shift at load = 0
a13 = 0;        % [N/deg/kN]    --------Camber influence on vertical shift, load dependent
a14 = 0;        % [N/deg]   --------Camber influence on vertical shift
a15 = 0;        % [1/deg]   --------Camber influence on lateral friction coefficient
a16 = 0;        % [-]       --------Curvature change with camber
a17 = 0;        % [-]       -------- 	Curvature shift

camber = 0;     % [rad] Camber angle

b1 = 0;         % [1/kN]    --------Load influence on longitudinal friction coefficient (*1000)
b2 = 2080;      % [-]       --------Longitudinal friction coefficient (*1000)
b11 = 0;
b12 = 0;

w1 = 10^(-4.5); % [-]       --------wear param1
w2 = 1;         % [-]       --------wear param2

%tyre wears param
K_wear = 1.8*10^-17;   % [m^3 s^3 / kg^2] --------coefficient that determines the wear
K_wear_less = 1.3*10^-17;
K_wear_more = 2.4*10^-17;
K_wear_set = [K_wear K_wear_less K_wear_more];

TyreContactAreaFront = 0.072137; % [m^2] --------area of contact between front tyre and asphalt
TyreContactAreaRear = 0.082758; % [m^2] --------area of contact between rear tyre and asphalt

K_wear_vel_0 = 10^-5.05;
K_wear_vel_0_relError = 10^-4.9;
K_wear_vel_0_set = [K_wear_vel_0 K_wear_vel_0_relError];

K_wear_vel_1 = 10^-5.25;

wear_selector = 1;
wear_relError_selector = 1;
%% Track parameters

[roadS1, roadS2, roadS3, roadS4, curveRays, curveCenters, curveZ, zOffset, ...
    xMax, xMin, yMax, yMin, bankingAngle, longStraight, shortStraight, turn] = track3d(0);
% create the track initializing all the coordinates and parameters for the
% shape of the road

%% Simulation parameters
m_fuel = 58; % [kg]  --------mass of the fuel
m_vehicle = 590; % [kg]  --------mass of only the vehicle
m_passenger = 70; % [kg]  --------mass of the passenger
mT = m_vehicle + m_fuel + m_passenger; % [kg]  --------total mass
g = 9.81; % [m/s^2]  --------gravity acceleration
a = 1.767; % [m]  --------distance betwen COG and front tyre
b = 1.353; % [m]  --------distance betwen COG and rear tyre
L = a + b; % [m]  --------wheelbase
IT = 606; % [kg m^2]  --------moment of inertia of the body
l_f = 0.414; % [-]   --------load distrib over front wheel
l_r = 0.586; % [-]   --------load distrib over rear wheel

Cf = 100000; % [..] --------Cornering stiffnes for linearization (front)
Cr = 120000; % [..] --------Cornering stiffnes for linearization (rear)

Cx_0 = 0.725; % [-] --------longitudinal drag coefficient non-slipstream
Cz_0 = 0.778; % [-]  --------vertical (lift) drag coefficient non-slipstream
Cx_1 = 0.616; % [-] --------longitudinal drag coefficient slipstream
Cz_1 = 0.545; % [-]  --------vertical (lift) drag coefficient slipstream
rho_0 = 1.225; % [kg/m^3]   --------air density non-slipstream
% rho_1 = 1.041; % [kg/m^3]     --------air density slipstream
Area = 1; % [m^2]   --------surface of vehicle on which the air goes through

init_vel = 75; % [m/s]  --------initial velocity  
init_x_pos = -250; % [m]  --------initial x position
init_y_pos = 0; % [m]  --------initial y position
init_yaw = 0; % [rad]  --------initial yaw angle

C_fuel = 2.1*10^-7; % [s^2/m^2] --------coefficient for fuel consumption

slipstreamON = 0; % 1 if slipstream ON, 0 for OFF
bankingON = 1; % 1 if banking ON, 0 for OFF

load banking_indy;  

RefTrajectory_8;
 