function imMat=interpPointCloud(M, remPerc)
    if nargin < 2
        remPerc = 0.005;
    end
    if remPerc>0
        M = sortrows(M,3);
        [Mlen, ~] = size(M);
        amRem = floor(Mlen*0.5*remPerc);
        M = M(amRem:(Mlen-amRem),:);
    end
    
    maxs = max(M);
    mins = min(M);
    x_range = maxs(1)-mins(1);
    y_range = maxs(2)-mins(1);
    scale_factor = min([10000/x_range, 10000/y_range]);
    M = scale_factor*M;
    maxs = max(M);
    mins = min(M);
    xMin = mins(1); xMax = maxs(1);
    yMin = mins(2); yMax = maxs(2);

    valInt = scatteredInterpolant(M(:,1),M(:,2),M(:,3),'linear','none');

    [xCoord, yCoord] = meshgrid(xMin:1:xMax, yMin:1:yMax);
    imMat = valInt(xCoord, yCoord);
    imMat(isnan(imMat)) = 0;
    
    
    
    