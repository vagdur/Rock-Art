function [im, convhull, dmask]=interpPointCloud(pc, removePercent,imSize,remHoles)
    if nargin < 3
        removePercent = 0.005;
        imSize = 10000;
        remHoles = 1;
    end
    if removePercent>0
        pc = sortrows(pc,3);
        [Mlen, ~] = size(pc);
        amountRemove = floor(Mlen*0.5*removePercent);
        pc = pc(amountRemove:(Mlen-amountRemove),:);
    end
    
    dmask = createPCDensityMap(pc);
    dmask = imerode(imdilate(dmask,true(5)),true(20));
    if remHoles
        dmask = imfill(dmask,'holes');
    end
    dmask = flip(imrotate(dmask,-90),2);
    
    maxs = max(pc);
    mins = min(pc);
    x_range = maxs(1)-mins(1);
    y_range = maxs(2)-mins(1);
    scale_factor = min([imSize/x_range, imSize/y_range]);
    pc = scale_factor*pc;
    pc = pc-min(pc)+[1 1 0];
    maxs = max(pc);
    xMax = ceil(maxs(1)); yMax = ceil(maxs(2));

    valInt = scatteredInterpolant(pc(:,1),pc(:,2),pc(:,3),'linear','none');

    [xCoord, yCoord] = meshgrid(1:1:xMax, 1:1:yMax);
    im = valInt(xCoord, yCoord);
    convhull = ~isnan(im);
    im(isnan(im)) = 0;
    dmask = imresize(dmask,size(im));
    
    
    
    