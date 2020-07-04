%% clear things
clc
close all
clear

%% craete driving scenario

scenario = drivingScenario;

%% define road and scenario
roadCenters = ...
    [   0   490     500     503     758.92      758.92      758.92      758.92      758.92      758.92      758.92      503     500     490     0           -490        -500        -503        -758.92     -758.92     -758.92     -758.92     -758.92     -758.92     -758.92     -503        -500        -490        0
        0   0       0       0       255.92      258.92      268.92      356.42      443.92      453.92      456.92      712.84  712.84  712.84  712.84      712.84      712.84      712.84      456.92      453.92      443.92      356.42      268.92      258.92      255.92      0           0           0           0
        0   0       0    	0    	0        	0           0           0           0           0           0        	0    	0       0       0           0           0           0           0        	0           0           0           0           0        	0        	0        	0           0           0]';
bankAngles = ...
    [   0   0       0    	0       0           0           0           0           0           0           0        	0       0       0       0           0           0           0        	0           0           0           0           0           0        	0        	0           0           0           0];
    

laneWidth = 15;

road(scenario, roadCenters, bankAngles, 'lanes', lanespec(1, 'width', laneWidth));
plot(scenario, 'RoadCenters', 'on', 'Waypoints', 'on');

%% plot boundaries
%rb = roadBoundaries(scenario);

%figure

%outerBoundary = rb{1};
%innerBoundary = rb{2};

%plot3(innerBoundary(:,1),innerBoundary(:,2),innerBoundary(:,3),'r', ...
%      outerBoundary(:,1),outerBoundary(:,2),outerBoundary(:,3),'g')
%axis equal

%% add vehicles
egoCar = vehicle(scenario,'ClassID',1,'Position',[0 0 0],'Yaw',0);
chasePlot(egoCar);
fastCar = vehicle(scenario,'ClassID',1, 'Position',[-5 10 0],'Yaw',0);

%% add trajectory
d = 2;
h = 0;
roadOffset = [ 0  0  0  0  d  d  d  d  d  d  d  0  0  0  0  0  0  0  -d  -d  -d  -d  -d  -d  -d  0  0  0  0
              -d -d -d -d  0  0  0  0  0  0  0  d  d  d  d  d  d  d  0   0   0   0   0   0   0   -d -d -d -d
               0  0  h  h  h  h  0  0  0  h  h  h  h  0  0  0  h  h  h   h   0   0   0   h   h   h  h  0  0]';

rWayPoints = roadCenters + roadOffset;
roadOffset(1) = -200;
roadOffset(29) = -200;
lWayPoints = roadCenters - roadOffset;

% loop around the track two times
rWayPoints = [repmat(rWayPoints(1:end-1,:),2,1); rWayPoints(1,:)];
lWayPoints = [repmat(lWayPoints(1:end-1,:),2,1); lWayPoints(1,:)];

egoSpeed = 25;
trajectory(egoCar,rWayPoints(:,:), egoSpeed);
fastCarSpeed = 25;
trajectory(fastCar,lWayPoints(:,:), fastCarSpeed);

%% simulation
%scenario.SampleTime = 0.1;

%scenario.StopTime = 60;
%while advance(scenario)
%    pause(0.001)
%end