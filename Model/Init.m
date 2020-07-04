%% Tyre setup
a0 = 1;         % Shape factor [-]
a1 = 0;         % Load dependency of lateral friction (*1000) [1/kN]
a2 = 800;       % Lateral friction level (*1000) [-]
a3 = 3000;      % Maximum cornering stiffness [N/deg]
a4 = 50;        % Load at maximum cornering stiffness [kN]
a5 = 0;         % Camber sensitivity of cornering stiffness
a6 = 0;         % Load dependency of curvature factor
a7 = -1;        % Curvature factor level
a8 = 0;         % Camber sensitivity of horizontal shift
a9 = 0;         % Load dependency of horizontal shift
a10 = 0;        % Horizontal shift level
a11 = 0;        % Combined load and camber sensitivity of vertical shift
a12 = 0;        % Load dependency of vertical shift
a13 = 0;        % Load dependency of vertical shift

camber = 0;     % Camber angle

mu_lateral = 0.3;

%% Track parameters
%global longStraight;
%longStraight = 1006;
%global shortStraight;
%shortStraight = 201;
%global turn;
%turn = 402;
%global curveCoord;
%curveCoord = turn * 2 / pi;

%[roadS1, roadS2, roadS3, roadS4] = plotTrack(0, 'g-', 2, 1);
[roadS1, roadS2, roadS3, roadS4, curveRays, curveCenters, curveZ, zOffset, ...
    xMax, xMin, yMax, yMin, bankingAngle] = track3d();

%% Simulation parameters
Ts = 0.1;

mT = 1500;
g = 9.81;
a = 1.2;
b = 1.6;
IT = 2875;

Cx = 0.8;
Cz = 1.5; %values to adjust
rho = 1.225;
Area = 2;   %assuming 2m^2 of surface for the vehicle

max_vel = 50;
init_vel = 20;
init_y_pos = -5.625;

C_fuel = 0.0000003;

cr = 0.003; %rolling resistence coeff

%tyre wears param
K_wear = 0.000000001; %-
H = 60; %N/m^2
TyreContactArea = 0.04; %m^2
TyreRadius = 0.17; %m
TyreArea = TyreRadius * TyreRadius * pi; %m^2 
TyreWidth = 0.2; %m
