function [image,convhull]=csvToImage(filepath,~)
    if (nargin==1)
        tic
        disp(['Loading ',filepath,'...'])
        raw = csvread(filepath);
        flattened = flattenRockSurface(raw);
        [image,convhull] = interpPointCloud(flattened);
        toc
        beep
    else
        raw = filepath;
        flattened = flattenRockSurface(raw);
        [image,convhull] = interpPointCloud(flattened);
    end
    
    