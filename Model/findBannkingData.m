function res = findBannkingData (x, y, curveCenters, bankingAngle)

if  ...
    (x > curveCenters(1,1) && y < curveCenters(1,2)) || ... %check if in the first curve
    (x > curveCenters(2,1) && y > curveCenters(2,2)) || ... %check if in the second curve
    (x < curveCenters(3,1) && y > curveCenters(3,2)) || ... %check if in the third curve
    (x < curveCenters(4,1) && y < curveCenters(4,2))        %check if in the fourth curve
        
    res = bankingAngle;
 
%default result for straights
else 
    res = 0;
end