function [image,convhull,dmask]=csvToImage(filepath,~)
    if (nargin==1)
        tic
        disp(['Loading ',filepath,'...'])
        raw = csvread(filepath);
        flattened = flattenRockSurface(raw);
        [image,convhull,dmask] = interpPointCloud(flattened);
        toc
        beep
    else
        raw = filepath;
        flattened = flattenRockSurface(raw);
        [image,convhull,dmask] = interpPointCloud(flattened);
    end
    
    