function [res1, res2, res3, res4] = plotTrack(offset, lineFormat, lineWidth, result)

%global longStraight;
%global shortStraight;
%global curveCoord;

longStraight = 1006;
shortStraight = 201;
turn = 402;
curveCoord = turn * 2 / pi;
            
hold on;
 
%first straight
S1 = [ -longStraight/2  longStraight/2;
       offset           offset          ];
plot(S1(1,:), S1(2,:), lineFormat, 'LineWidth', lineWidth);

%first curve
thC1 = -pi/2:pi/100:0;
xunitC1 = (curveCoord-offset) * cos(thC1) + S1(1,2);
yunitC1 = (curveCoord-offset) * sin(thC1) + S1(2,2) + curveCoord - offset;
plot(xunitC1, yunitC1, lineFormat, 'LineWidth', lineWidth);

%second straight
S2 = [ S1(1,2)+curveCoord-offset   S1(1,2)+curveCoord-offset;  
       S1(2,2)+curveCoord-offset   S1(2,2)+curveCoord-offset+shortStraight];
plot(S2(1,:), S2(2,:), lineFormat, 'LineWidth', lineWidth);

%second curve
thC2 = 0:pi/100:pi/2;
xunitC2 = (curveCoord-offset) * cos(thC2) + S2(1,2)-curveCoord+offset;
yunitC2 = (curveCoord-offset) * sin(thC2) + S2(2,2);
plot(xunitC2, yunitC2, lineFormat, 'LineWidth', lineWidth);

%third straight
S3 = [ S2(1,2)-curveCoord+offset   S2(1,2)-curveCoord+offset-longStraight;  
       S2(2,2)+curveCoord-offset   S2(2,2)+curveCoord-offset ];
plot(S3(1,:), S3(2,:), lineFormat, 'LineWidth', lineWidth);

%third curve
thC3 = pi/2:pi/100:pi;
xunitC3 = (curveCoord-offset) * cos(thC3) + S3(1,2);
yunitC3 = (curveCoord-offset) * sin(thC3) + S3(2,2)-curveCoord+offset;
plot(xunitC3, yunitC3, lineFormat, 'LineWidth', lineWidth);

%fourth straight
S4 = [ S3(1,2)-curveCoord+offset   S3(1,2)-curveCoord+offset;  
       S3(2,2)-curveCoord+offset   S3(2,2)-curveCoord+offset-shortStraight ];
plot(S4(1,:), S4(2,:), lineFormat, 'LineWidth', lineWidth);

%fourth curve
thC4 = pi:pi/100:3*pi/2;
xunitC4 = (curveCoord-offset) * cos(thC4) + S4(1,2)+curveCoord-offset;
yunitC4 = (curveCoord-offset) * sin(thC4) + S4(2,2);
plot(xunitC4, yunitC4, lineFormat, 'LineWidth', lineWidth);

hold off;

if result == 1
    res1 = S1;
    res2 = S2;
    res3 = S3;
    res4 = S4;
end

end