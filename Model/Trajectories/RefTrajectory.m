% %% initial setup
% global trajec;
% radius_second_lane = 262.89;
% curve_lenght = radius_second_lane * 2 * pi/4;
% total_length =  2*longStraight + 2*shortStraight + curve_lenght*4;
% total_length = total_length -0.2;
% 
% %% abscissa
% s_curv = 0:0.1:total_length;
% 
% %% x_y_coord
% x_coord1 = -502.9:0.1:502.9;
% y_coord1 = ones(1, length(x_coord1))*(-6.75);
% 
% x_coord5 = 502.9:-0.1:-502.9;
% y_coord5 = ones(1, length(x_coord5))*(720.04);
% 
% y_coord3 = 256.24:0.1:457.04;
% x_coord3 = ones(1, length(y_coord3))*765.89;
% 
% y_coord7 = 457.04:-0.1:256.24;
% x_coord7 = ones(1, length(y_coord7))*(-765.89);
% 
% angles = 0:0.021795:90;
% 
% x_coord2 = radius_second_lane*sind(angles) + 503;
% y_coord2 = 256.14 - radius_second_lane*cosd(angles);
% 
% x_coord4 = radius_second_lane*cosd(angles) + 503;
% y_coord4 = 457.14 + radius_second_lane*sind(angles);
% 
% x_coord6 = -503 - radius_second_lane*sind(angles);
% y_coord6 = 457.14 + radius_second_lane*cosd(angles);
% 
% x_coord8 = -503 - radius_second_lane*cosd(angles);
% y_coord8 = 256.14 - radius_second_lane*sind(angles);
% 
% %% velocity_profile
% v1 = 30:0.00375:60;
% v2 = 60:-0.00850:25;
% v3 = 25:0.00614:50;
% v4 = 50:-0.01210:25;
% v5 = 25:0.00242:30;
% v_profile_half = [v1 v2 25 v3 50 v4 25 v5]; 
% 
% %% yaw_values
% 
% yaw1 = zeros(1, length(x_coord1));
% yaw2 = angles;
% yaw3 = ones(1, length(x_coord3))*90;
% yaw4 = angles + 90;
% yaw5 = ones(1, length(x_coord5))*(180); 
% yaw6 = angles + 180;
% yaw7 = ones(1, length(x_coord7))*(270);
% yaw8 = angles + 270;
% 
% %% matrix definition
% trajec = ones(5, size(s_curv, 2));
% trajec(1, :) = s_curv;
% trajec(2, :) = [x_coord1 x_coord2 x_coord3 x_coord4 x_coord5 x_coord6 x_coord7 x_coord8];
% trajec(3, :) = [y_coord1 y_coord2 y_coord3 y_coord4 y_coord5 y_coord6 y_coord7 y_coord8];
% trajec(4, :) = [yaw1 yaw2 yaw3 yaw4 yaw5 yaw6 yaw7 yaw8];
% trajec(5, :) = [v_profile_half v_profile_half];

global trajec;

%% initial setup
radius_second_lane = 262.89;
curve_lenght = radius_second_lane * 2 * pi/4;
total_length =  2*longStraight + 2*shortStraight + curve_lenght*4;
total_length = total_length -0.2;
step_size = 0.1;
right_angle = 90;

%% abscissa
s_curv = 0:step_size:total_length;

%% x_y_coord
x_coord_longstraight1 = curveCenters(4,1)+step_size:step_size:curveCenters(1,1)-step_size;
y_coord_longstraight1 = ones(1, length(x_coord_longstraight1))*(curveCenters(1,2)-radius_second_lane);

x_coord_longstraight2 = curveCenters(2,1)-step_size:-step_size:curveCenters(3,1)+step_size;
y_coord_longstraight2 = ones(1, length(x_coord_longstraight2))*(curveCenters(2,2)+radius_second_lane);

y_coord_shortstraight1 = curveCenters(1,2)+step_size:step_size:curveCenters(2,2)-step_size;
x_coord_shortstraight1 = ones(1, length(y_coord_shortstraight1))*curveCenters(1,1)+radius_second_lane;

y_coord_shortstraight2 = curveCenters(3,2)-step_size:-step_size:curveCenters(4,2)+step_size;
x_coord_shortstraight2 = ones(1, length(y_coord_shortstraight2))*curveCenters(4,1)-radius_second_lane;

% y_coord3 = 256.24:0.1:457.04;
% x_coord3 = ones(1, length(y_coord3))*765.89;
% 
% y_coord7 = 457.04:-0.1:256.24;
% x_coord7 = ones(1, length(y_coord7))*(-765.89);

%% debug
% length(x_coord_longstraight1) 
% length(x_coord_shortstraight1) 
% length(x_coord_shortstraight2) 
% length(x_coord_firstcurve)
% length(x_coord_secondcurve) 
% length(x_coord_thirdcurve) 
% length(x_coord_fourthcurve)       

length_firstcurve = pi*radius_second_lane/2;
length_firstcurve = length_firstcurve/step_size;
pace = right_angle/length_firstcurve;
angles = 0:pace:right_angle;

x_coord_firstcurve = radius_second_lane*sind(angles) + curveCenters(1,1);
y_coord_firstcurve = curveCenters(1,2) - radius_second_lane*cosd(angles);

x_coord_secondcurve = radius_second_lane*cosd(angles) + curveCenters(1,1);
y_coord_secondcurve = curveCenters(2,2) + radius_second_lane*sind(angles);

x_coord_thirdcurve = curveCenters(4,1) - radius_second_lane*sind(angles);
y_coord_thirdcurve = curveCenters(2,2) + radius_second_lane*cosd(angles);

x_coord_fourthcurve = curveCenters(4,1) - radius_second_lane*cosd(angles);
y_coord_fourthcurve = curveCenters(1,2) - radius_second_lane*sind(angles);

%% velocity_profile

stretch1 = 806;
v1_start = 30;
v1_end = 60;
pace1 = (v1_end - v1_start)/stretch1*step_size;

stretch2 = 406;
v2_start = v1_end;
v2_end = 25;
pace2 = (v2_end - v2_start)/stretch2*step_size;

stretch3 = 406;
v3_start = v2_end;
v3_end = 50;
pace3 = (v3_end - v3_start)/stretch3*step_size;

stretch4 = 207;
v4_start = v3_end;
v4_end = 25;
pace4 = (v4_end - v4_start)/stretch4*step_size;

stretch5 = 207;
v5_start = v4_end;
v5_end = 30;
pace5 = (v5_end - v5_start)/stretch5*step_size;

v1 = v1_start:pace1:v1_end;
v2 = v2_start:pace2:v2_end;
v3 = v3_start:pace3:v3_end;
v4 = v4_start:pace4:v4_end;
v5 = v5_start:pace5:v5_end;
v_profile_half = [v1 v2 v3_start v3 v4_start v4 v5_start v5]; 

%% yaw_values

yaw1 = zeros(1, length(x_coord_longstraight1));
yaw2 = angles;
yaw3 = ones(1, length(x_coord_shortstraight1))*90;
yaw4 = angles + 90;
yaw5 = ones(1, length(x_coord_longstraight2))*(180); 
yaw6 = angles + 180;
yaw7 = ones(1, length(x_coord_shortstraight2))*(270);
yaw8 = angles + 270;

%% matrix definition
trajec = ones(5, size(s_curv, 2));
trajec(1, :) = s_curv;
trajec(2, :) = [x_coord_longstraight1 x_coord_firstcurve x_coord_shortstraight1 x_coord_secondcurve x_coord_longstraight2 x_coord_thirdcurve x_coord_shortstraight2 x_coord_fourthcurve];
trajec(3, :) = [y_coord_longstraight1 y_coord_firstcurve y_coord_shortstraight1 y_coord_secondcurve y_coord_longstraight2 y_coord_thirdcurve y_coord_shortstraight2 y_coord_fourthcurve];
trajec(4, :) = [yaw1 yaw2 yaw3 yaw4 yaw5 yaw6 yaw7 yaw8];
trajec(5, :) = [v_profile_half v_profile_half];
