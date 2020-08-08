%% initial setup
radius_second_lane = 262.89;
curve_lenght = radius_second_lane * 2 * pi/4;
total_length =  2*longStraight + 2*shortStraight + curve_lenght*4;
total_length = total_length -0.2;

%% abscissa
s_curv = 0:0.1:total_length;

%% x_y_coord
x_coord1 = -502.9:0.1:502.9;
y_coord1 = ones(1, length(x_coord1))*(-6.75);

x_coord5 = 502.9:-0.1:-502.9;
y_coord5 = ones(1, length(x_coord5))*(720.04);

y_coord3 = 256.24:0.1:457.04;
x_coord3 = ones(1, length(y_coord3))*765.89;

y_coord7 = 457.04:-0.1:256.24;
x_coord7 = ones(1, length(y_coord7))*(-765.89);

angles = 0:0.021795:90;

x_coord2 = radius_second_lane*sind(angles) + 503;
y_coord2 = 256.14 - radius_second_lane*cosd(angles);

x_coord4 = radius_second_lane*cosd(angles) + 503;
y_coord4 = 457.14 + radius_second_lane*sind(angles);

x_coord6 = -503 - radius_second_lane*sind(angles);
y_coord6 = 457.14 + radius_second_lane*cosd(angles);

x_coord8 = -503 - radius_second_lane*cosd(angles);
y_coord8 = 256.14 - radius_second_lane*sind(angles);

%% velocity_profile
v1 = 30:0.00375:60;
v2 = 60:-0.00850:25;
v3 = 25:0.00614:50;
v4 = 50:-0.01210:25;
v5 = 25:0.00242:30;
v_profile_half = [v1 v2 25 v3 50 v4 25 v5]; 

%% yaw_values

yaw1 = zeros(1, length(x_coord1));
yaw2 = angles;
yaw3 = ones(1, length(x_coord3))*90;
yaw4 = angles + 90;
yaw5 = ones(1, length(x_coord5))*(180); 
yaw6 = angles + 180;
yaw7 = ones(1, length(x_coord7))*(270);
yaw8 = angles + 270;

%% matrix definition
trajec = ones(5, size(s_curv, 2));
trajec(1, :) = s_curv;
trajec(2, :) = [x_coord1 x_coord2 x_coord3 x_coord4 x_coord5 x_coord6 x_coord7 x_coord8];
trajec(3, :) = [y_coord1 y_coord2 y_coord3 y_coord4 y_coord5 y_coord6 y_coord7 y_coord8];
trajec(4, :) = [yaw1 yaw2 yaw3 yaw4 yaw5 yaw6 yaw7 yaw8];
trajec(5, :) = [v_profile_half v_profile_half];
