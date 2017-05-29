function image=csvToImage(filepath,~)
    if (nargin==1)
        tic
        disp(['Loading ',filepath,'...'])
        warning('off','curvefit:fit:equationBadlyConditioned');
        raw = csvread(filepath);
        flattened = flattenRockSurface(raw);
        image = interpPointCloud(flattened);
        toc
        beep
    else
        warning('off','curvefit:fit:equationBadlyConditioned');
        raw = filepath;
        flattened = flattenRockSurface(raw);
        image = interpPointCloud(flattened);
    end
    warning('on','curvefit:fit:equationBadlyConditioned');
    