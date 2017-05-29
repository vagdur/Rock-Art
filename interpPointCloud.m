function [im, convhull]=interpPointCloud(pc, removePercent)
    if nargin < 2
        removePercent = 0.005;
    end
    if removePercent>0
        pc = sortrows(pc,3);
        [Mlen, ~] = size(pc);
        amountRemove = floor(Mlen*0.5*removePercent);
        pc = pc(amountRemove:(Mlen-amountRemove),:);
    end
    
    maxs = max(pc);
    mins = min(pc);
    x_range = maxs(1)-mins(1);
    y_range = maxs(2)-mins(1);
    scale_factor = min([10000/x_range, 10000/y_range]);
    pc = scale_factor*pc;
    maxs = max(pc);
    mins = min(pc);
    xMin = mins(1); xMax = maxs(1);
    yMin = mins(2); yMax = maxs(2);

    valInt = scatteredInterpolant(pc(:,1),pc(:,2),pc(:,3),'linear','none');

    [xCoord, yCoord] = meshgrid(xMin:1:xMax, yMin:1:yMax);
    im = valInt(xCoord, yCoord);
    convhull = ~isnan(im);
    im(isnan(im)) = 0;
    
    
    
    