%% Tyre setup
a0 = 1.4;%1         % [-] \text{--------Shape factor}
a1 = 0;         % [1/kN] \text{--------Load influence on lateral friction coefficient (*1000)}
a2 = 500;%800       % [-] \text{--------Lateral friction coefficient (*1000)}
a3 = 1100;%3000      % [N/deg] \text{--------Change of stiffness with slip}
a4 = 10;%50        % kN] \text{--------Change of progressivity of stiffness / load}
a5 = 0;         % [\%/deg/100] \text{--------Camber influence on stiffness}
a6 = 0;         % [-] \text{--------Curvature change with load}
a7 = -2;%-1        % [-] \text{--------Curvature factor}
a8 = 0;         % [deg/kN] \text{--------Load influence on horizontal shift}
a9 = 0;         % [deg] \text{--------Horizontal shift at load = 0 and camber = 0}
a10 = 0;        %  [-] \text{--------Camber influence on horizontal shift}
a11 = 0;        % [N] \text{--------Vertical shift}
a12 = 0;        % [N] \text{--------Vertical shift at load = 0}
a13 = 0;        % [N/deg/kN] \text{--------Camber influence on vertical shift, load dependent}
a14 = 0; 	% [N/deg] \text{--------Camber influence on vertical shift}
a15 = 0;	% [1/deg] \text{--------Camber influence on lateral friction coefficient}
a16 = 0;	% [-] \text{--------Curvature change with camber}
a17 = 0;	% [-] \text{-------- 	Curvature shift}

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
