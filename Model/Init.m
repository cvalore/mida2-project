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

w1 = 10^(-4.7); % [-]       --------wear param1
w2 = 1;         % [-]       --------wear param2

%tyre wears param
K_wear = 1.3*10^-17; % [m^3 s^3 / kg^2] --------coefficient that determines the wear
TyreContactArea = 0.06; % [m^2] --------area of contact between tyre and asphalt
%% Track parameters
[roadS1, roadS2, roadS3, roadS4, curveRays, curveCenters, curveZ, zOffset, ...
    xMax, xMin, yMax, yMin, bankingAngle] = track3d(0);
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

Cx = 0.725; % [-] --------longitudinal drag coefficient
Cz = 0.778; % [-]  --------vertical (lift) drag coefficient
rho_0 = 1.225; % [kg/m^3]   --------air density non-slipstream
rho_1 = 0.8; % [kg/m^3]     --------air density slipstream
Area = 1; % [m^2]   --------surface of vehicle on which the air goes through

distanceThreshold = 10; % [m]  --------distance below which slipstream is considered ON
d_F= 0.8193*2; %[m] --------front track width
overlapThreshold = d_F/2; % [m]  --------width below which slipstream is considered ON
alpha = 0.7; % [-]  --------coefficient to change slipstream distance and widht during curves

init_vel = 20; % [m/s]  --------initial velocity  
init_x_pos = 0; % [m]  --------initial x position
init_y_pos = -5.625; % [m]  --------initial y position
init_yaw = 0; % [rad]  --------initial yaw angle

bankingThresholdLong = 110; % [m]  --------distance on the long straight
                            %              from the curve below which the banking starts
bankingThresholdShort = 40; % [m]  --------distance on the short straight
                            %              from the curve below which the banking starts

C_fuel = 0.0000003; % [s^2/m^2] --------coefficient for fuel consumption

slipstreamON = 0; % 1 if slipstream ON, 0 for OFF
bankingON = 1; % 1 if banking ON, 0 for OFF
