function res = findZData (x, y, curveRays, curveCenters, curveZ, ...
    zOffset, xMax, yMax, xMin, yMin, bankingAngle)

%check if in the first curve
if x > curveCenters(1,1) && x <= xMax && ...
        y >= yMin && y < curveCenters(1,2)
    d = sqrt((x - curveCenters(1,1)).^2 + (y - curveCenters(1,2)).^2);
    index = 1;
    
    for i = 1:size(curveRays, 1)
        if curveRays(i,1) > d
            index = i - 1;
            break;
        end
    end
    nx = d - curveRays(index, 1);
    nh = nx * tan(index * bankingAngle);
    
    res = [curveZ(index, 1)+nh, index * bankingAngle];

%check if in the second curve
elseif x > curveCenters(2,1) && x <= xMax && ...
        y <= yMax && y > curveCenters(2,2)
    d = sqrt((x - curveCenters(2,1)).^2 + (y - curveCenters(2,2)).^2);
    index = 1;
    
    for i = 1:size(curveRays, 1)
        if curveRays(i,1) > d
            index = i - 1;
            break;
        end
    end
    nx = d - curveRays(index, 1);
    nh = nx * tan(index * bankingAngle);
    
    res = [curveZ(index, 1)+nh, index * bankingAngle];
    
%check if in the third curve
elseif x < curveCenters(3,1) && x >= xMin && ...
        y <= yMax && y > curveCenters(3,2)
    d = sqrt((x - curveCenters(3,1)).^2 + (y - curveCenters(3,2)).^2);
    index = 1;
    
    for i = 1:size(curveRays, 1)
        if curveRays(i,1) > d
            index = i - 1;
            break;
        end
    end
    nx = d - curveRays(index, 1);
    nh = nx * tan(index * bankingAngle);
    l
    res = [curveZ(index, 1)+nh, index * bankingAngle];
    
%check if in the fourth curve
elseif x < curveCenters(4,1) && x >= xMin && ...
        y >= yMin && y < curveCenters(4,2)
    d = sqrt((x - curveCenters(4,1)).^2 + (y - curveCenters(4,2)).^2);
    index = 1;
    
    for i = 1:size(curveRays, 1)
        if curveRays(i,1) > d
            index = i - 1;
            break;
        end
    end
    nx = d - curveRays(index, 1);
    nh = nx * tan(index * bankingAngle);
    
    res = [curveZ(index, 1)+nh, index * bankingAngle];
    
%default result for straights
else 
    res = [zOffset, 0];
end