%% close init figure
if ishandle(1)
close(1);
end

%% plot the track by drawing respectively..
roadWidth = 15;
plotTrack(roadWidth/2, 'g-', 2, 0);       %.. the left border
plotTrack(-roadWidth/2, 'g-', 2, 0);      %.. the right border

%% plot lanes
numOfLanes = 4;
for i = -(roadWidth/2)+(roadWidth/numOfLanes)...
        :(roadWidth/numOfLanes)...
        :(roadWidth/2)-(roadWidth/numOfLanes)
   plotTrack(i, 'g--', 0.3, 0); 
end

%% plot the results of the sim
hold on;

plot(out.egoX_Pos, out.egoY_Pos, 'b-', 'LineWidth', 1.5);
title('X-Y positions');
xlabel('X pos [m]');
ylabel('Y pos [m]');
grid on;

hold off;