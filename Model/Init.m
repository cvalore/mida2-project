%% Tyre setup
a0 = 1.4;%1         % Shape factor [-]
a1 = 0;         % Load dependency of lateral friction (*1000) [1/kN]
a2 = 500;%800       % Lateral friction level (*1000) [-]
a3 = 1100;%3000      % Maximum cornering stiffness [N/deg]
a4 = 10;%50        % Load at maximum cornering stiffness [kN]
a5 = 0;         % Camber sensitivity of cornering stiffness
a6 = 0;         % Load dependency of curvature factor
a7 = -2;%-1        % Curvature factor level
a8 = 0;         % Camber sensitivity of horizontal shift
a9 = 0;         % Load dependency of horizontal shift
a10 = 0;        % Horizontal shift level
a11 = 0;        % Combined load and camber sensitivity of vertical shift
a12 = 0;        % Load dependency of vertical shift
a13 = 0;        % Load dependency of vertical shift

%%add for new Pajecka model (test)
a14 = 0; 	%Camber influence on vertical shift 	N/deg 	-15 .. +15 	
a15 = 0;	%Camber influence on lateral friction coefficient 	1/deg 	-0.01 .. +0.01 	
a16 = 0;	%Curvature change with camber 		-0.1 .. +0.1 
a17 = 0;	%Curvature shift
%%

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
%Ts = 0.1;

mT = 1500;
g = 9.81;
a = 1.2;
b = 1.6;
IT = 2875;
l_f = 0.48; %load distrib over front wheel
l_r = 0.52; %load distrib over rear wheel

Cx = 0.8;
Cz = 1.5; %values to adjust
rho = 1.225;
Area = 2;   %assuming 2m^2 of surface for the vehicle

max_vel = 50;
init_vel = 20;
init_y_pos = -5.625;

C_fuel = 0.0000003;

%tyre wears param
K_wear = 10^(-9); %-?
H = 10^9; %-?
TyreContactArea = 0.06; %m^2
TyreRadius = 0.17; %m
TyreArea = TyreRadius * TyreRadius * pi; %m^2 
TyreWidth = 0.2; %m
