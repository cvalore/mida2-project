function plotRes_2d(model_index, out)

global roadS1;
global roadS2;
global roadS3;
global roadS4;
global curveRays;
global curveCenters;
global trajec;

close all
clc

figure('WindowState', 'maximized');

hold on, box on, grid on

model = strcat('Model', int2str(model_index));

nLanesStraight = 3;
nLanesCurve = 4;
roadWidth = 15;
curveWidth = 18;
longStraight = 1006;
shortStraight = 201;
turn = 402.35;
curveCoord = turn * 2 / pi;

s1 = (curveCenters(1,2)-curveCoord-curveWidth):(roadWidth/3):(curveCenters(1,2)-curveCoord-(curveWidth-roadWidth));
s2 = (curveCenters(1,1)+curveCoord+(curveWidth-roadWidth):(roadWidth/3):curveCenters(1,1)+curveCoord+curveWidth);
s3 = (curveCenters(2,2)+curveCoord+(curveWidth-roadWidth)):(roadWidth/3):(curveCenters(2,2)+curveCoord+curveWidth);
s4 = (curveCenters(3,1)-curveCoord-curveWidth:(roadWidth/3):curveCenters(3,1)-curveCoord-(curveWidth-roadWidth));
for i=1:size(s1,2)
    plot(roadS1(1,:),zeros(2)+s1(1,i), 'k-');
end
for i=1:size(s2,2)
    plot(zeros(2)+s2(1,i), roadS2(2,:), 'k-');
end
for i=1:size(s3,2)
    plot(roadS3(1,:),zeros(2)+s3(1,i), 'k-');
end
for i=1:size(s4,2)
    plot(zeros(2)+s4(1,i), roadS4(2,:), 'k-');
end

% [xS1, yS1] = meshgrid(roadS1(1,1):(longStraight/10):roadS1(1,2), ...
%     (curveCenters(1,2)-curveCoord-curveWidth):(roadWidth/3):(curveCenters(1,2)-curveCoord-(curveWidth-roadWidth)));
% plot(xS1, yS1, 'k-');
% 
% [xS2, yS2] = meshgrid(curveCenters(1,1)+curveCoord+(curveWidth-roadWidth):(roadWidth/3):curveCenters(1,1)+curveCoord+curveWidth, ...
%     roadS2(2,1):(shortStraight/5):roadS2(2,2));
% plot(xS2, yS2, 'k-');
% 
% [xS3, yS3] = meshgrid(roadS3(1,2):(longStraight/10):roadS3(1,1), ...
%     (curveCenters(2,2)+curveCoord+(curveWidth-roadWidth)):(roadWidth/3):(curveCenters(2,2)+curveCoord+curveWidth));
% plot(xS3, yS3, 'k-');
% 
% [xS4, yS4] = meshgrid(curveCenters(3,1)-curveCoord-curveWidth:(roadWidth/3):curveCenters(3,1)-curveCoord-(curveWidth-roadWidth), ...
%     roadS4(2,2):(shortStraight/6):roadS4(2,1));
% plot(xS4, yS4, 'k-');

[TC1, RC1] = meshgrid(linspace(-pi/2, 0, 20), linspace(curveCoord, curveCoord+curveWidth, 5));
xC1 = RC1.*cos(TC1);
yC1 = RC1.*sin(TC1);
xC1 = xC1 + longStraight/2;
yC1 = yC1 + curveCoord;
plot(xC1, yC1, 'k-');

[TC2, RC2] = meshgrid(linspace(0, pi/2, 20), linspace(curveCoord, curveCoord+curveWidth, 5));
xC2 = RC2.*cos(TC2);
yC2 = RC2.*sin(TC2);
xC2 = xC2 + longStraight/2;
yC2 = yC2 + curveCoord + shortStraight;
plot(xC2, yC2, 'k-');

[TC3, RC3] = meshgrid(linspace(pi/2, pi, 20), linspace(curveCoord, curveCoord+curveWidth, 5));
xC3 = RC3.*cos(TC3);
yC3 = RC3.*sin(TC3);
xC3 = xC3 - longStraight/2;
yC3 = yC3 + curveCoord + shortStraight;
plot(xC3, yC3, 'k-');

[TC4, RC4] = meshgrid(linspace(pi, 3*pi/2, 20), linspace(curveCoord, curveCoord+curveWidth, 5));
xC4 = RC4.*cos(TC4);
yC4 = RC4.*sin(TC4);
xC4 = xC4 - longStraight/2;
yC4 = yC4 + curveCoord;
plot(xC4, yC4, 'k-');

plot(trajec(2,:), trajec(3,:), 'r--');

plot(out.logsout.find('BlockPath', strcat(model, '/x_pos[m]')).getElement(1).Values(:,1).Data, ...
     out.logsout.find('BlockPath', strcat(model, '/y_pos[m]')).getElement(1).Values(:,1).Data, ...
     'b-', 'LineWidth', 1.1);
title('X-Y positions');
xlabel('X pos [m]');
ylabel('Y pos [m]');
grid on;

hold off