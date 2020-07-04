%[r,c] = find((straight1.XData==0) & (straight1.YData==0))
%zFound = straight1.ZData(r, c)
x = 505;
y = 0;
z = zOffset;

[a, b] = find(straight1.XData == -503 & straight1.YData == -7.5)
straight1.ZData(a, b)

%xs1 = find(straight1.XData(1,1) <= x & straight1.XData(1, size(straight1.XData, 2)) >= x & ...
%    (straight1.XData >= x | straight1.XData <= x), 2*size(straight1.XData, 1))
%ys1 = find(straight1.YData(1,1) <= y & straight1.YData(size(straight1.YData, 1), 1) >= y & ...
%    (straight1.YData >= y | straight1.YData <= y), 2*size(straight1.YData, 2))

%pointsS1 = intersect(xs1, ys1)

%if isempty(pointsS1)
    % search in the others straights
%end

%am I in the first curve?
%if x > xS1(1,size(xS1, 2)) && x <= xS2(1,size(xS2, 2)) && ...
%    y >= yS1(1,1) && y < yS2(1,1)

%       xc1 = find(curve1.XData == x)
%       yc1 = find(curve1.YData == y)
%end

