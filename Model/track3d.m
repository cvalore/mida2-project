function [rS1, rS2, rS3, rS4, rCurveRays, rCurveCenters, rCurveZ, rZOffset,...
    rXMax, rXMin, rYMax, rYMin, rBankingAngle] = track3d ()
%% setup track
longStraight = 1006;
shortStraight = 201;
turn = 402;
curveCoord = turn * 2 / pi;

roadWidth = 15;
curveWidth = 18;
bankingAngle = deg2rad(9 + (12/60));

%first straight
S1 = [ -longStraight/2  longStraight/2;
       0                0          ];

%second straight
S2 = [ S1(1,2)+curveCoord   S1(1,2)+curveCoord;  
       S1(2,2)+curveCoord   S1(2,2)+curveCoord+shortStraight];
   
%third straight
S3 = [ S2(1,2)-curveCoord   S2(1,2)-curveCoord-longStraight;  
       S2(2,2)+curveCoord   S2(2,2)+curveCoord ];

%fourth straight
S4 = [ S3(1,2)-curveCoord   S3(1,2)-curveCoord;  
       S3(2,2)-curveCoord   S3(2,2)-curveCoord-shortStraight ];
 
%% create surfaces for straight sectors
hold on;

[xS1, yS1] = meshgrid(S1(1,1):(longStraight/10):S1(1,2), ...
    (-roadWidth/2):(roadWidth/3):(roadWidth/2));
zS1 = zeros(size(xS1, 1), size(xS1, 2));

[xS2, yS2] = meshgrid((-roadWidth/2):(roadWidth/3):(roadWidth/2), ...
    S2(2,1):(shortStraight/5):S2(2,2));
xS2 = xS2 + longStraight/2 + curveCoord;
zS2 = zeros(size(xS2, 1), size(xS2, 2));

[xS3, yS3] = meshgrid(S3(1,2):(longStraight/10):S3(1,1), ...
    (-roadWidth/2):(roadWidth/3):(roadWidth/2));
yS3 = yS3 + curveCoord + shortStraight + curveCoord;
zS3 = zeros(size(xS3, 1), size(xS3, 2));

[xS4, yS4] = meshgrid((-roadWidth/2):(roadWidth/3):(roadWidth/2), ...
    S4(2,2):(shortStraight/6):S4(2,1));
xS4 = xS4 - longStraight/2 - curveCoord;
zS4 = zeros(size(xS4, 1), size(xS4, 2));

[TC1, RC1] = meshgrid(linspace(-pi/2, 0, 20), linspace(curveCoord-(curveWidth-roadWidth/2), curveCoord+(roadWidth/2), 5));
xC1 = RC1.*cos(TC1);
yC1 = RC1.*sin(TC1);
xC1 = xC1 + longStraight/2;
yC1 = yC1 + curveCoord;
zC1 = zeros(size(xC1, 1), size(xC1, 2));

[TC2, RC2] = meshgrid(linspace(0, pi/2, 20), linspace(curveCoord-(curveWidth-roadWidth/2), curveCoord+(roadWidth/2), 5));
xC2 = RC2.*cos(TC2);
yC2 = RC2.*sin(TC2);
xC2 = xC2 + longStraight/2;
yC2 = yC2 + curveCoord + shortStraight;
zC2 = zeros(size(xC2, 1), size(xC2, 2));

[TC3, RC3] = meshgrid(linspace(pi/2, pi, 20), linspace(curveCoord-(curveWidth-roadWidth/2), curveCoord+(roadWidth/2), 5));
xC3 = RC3.*cos(TC3);
yC3 = RC3.*sin(TC3);
xC3 = xC3 - longStraight/2;
yC3 = yC3 + curveCoord + shortStraight;
zC3 = zeros(size(xC3, 1), size(xC3, 2));

[TC4, RC4] = meshgrid(linspace(pi, 3*pi/2, 20), linspace(curveCoord-(curveWidth-roadWidth/2), curveCoord+(roadWidth/2), 5));
xC4 = RC4.*cos(TC4);
yC4 = RC4.*sin(TC4);
xC4 = xC4 - longStraight/2;
yC4 = yC4 + curveCoord;
zC4 = zeros(size(xC4, 1), size(xC4, 2));

for i = 1:1:size(zC1, 1)-1
    zC1(i+1,:) = zC1(i,:)+(curveWidth/4)*sin(bankingAngle);
end
for i = 1:1:size(zC2, 1)-1
    zC2(i+1,:) = zC2(i,:)+(curveWidth/4)*sin(bankingAngle);
end
for i = 1:1:size(zC3, 1)-1
    zC3(i+1,:) = zC3(i,:)+(curveWidth/4)*sin(bankingAngle);
end
for i = 1:1:size(zC4, 1)-1
    zC4(i+1,:) = zC4(i,:)+(curveWidth/4)*sin(bankingAngle);
end

% rescale straights by z offset, adjust starting of bank
zOffset = zC1(size(zC1, 1),1);
zS1 = zS1 + zOffset;
zS2 = zS2 + zOffset;
zS3 = zS3 + zOffset;
zS4 = zS4 + zOffset;

% reformat data from later usage of find
curveRays = RC1(:,1); % rays from C1, C2, C3 and C4 are the same
curveCenters = [    longStraight/2, curveCoord;
                    longStraight/2, curveCoord + shortStraight;
                    -longStraight/2, curveCoord + shortStraight;
                    -longStraight/2, curveCoord;];
curveZ = zC1(:,1); % z from C1, C2, C3 and C4 are the same;

xMax = longStraight/2 + curveCoord + roadWidth/2;
yMax = curveCoord + shortStraight + curveCoord + shortStraight/2;
xMin = -xMax;
yMin = 0 - roadWidth/2;

%% plot
surf(xS1, yS1, zS1);
surf(xS2, yS2, zS2);
surf(xS3, yS3, zS3);
surf(xS4, yS4, zS4);
surf(xC1, yC1, zC1);
surf(xC2, yC2, zC2);
surf(xC3, yC3, zC3);
surf(xC4, yC4, zC4);

%set(gca,'xtick',[-900:100:900])
%set(gca,'ytick',[-100:100:800])
xlim([-900, 900]);
ylim([-100, 800]);
zlim([0, 50]);
xlabel('X [m]');
ylabel('Y [m]');
zlabel('Z [m]');
title('Track');

hold off;
hold on
g_y=[-100:100:800]; % user defined grid Y [start:spaces:end]
g_x=[-900:100:900]; % user defined grid X [start:spaces:end]
for i=1:length(g_x)
   plot([g_x(i) g_x(i)],[g_y(1) g_y(end)],'k:') %y grid lines
   hold on    
end
for i=1:length(g_y)
   plot([g_x(1) g_x(end)],[g_y(i) g_y(i)],'k:') %x grid lines
   hold on    
end
hold off;

%% return all needed
rS1 = S1;
rS2 = S2;
rS3 = S3;
rS4 = S4;
rCurveRays = curveRays;
rCurveCenters = curveCenters;
rCurveZ = curveZ;
rZOffset = zOffset;
rXMax = xMax;
rXMin = xMin;
rYMax = yMax;
rYMin = yMin;
rBankingAngle = bankingAngle;
