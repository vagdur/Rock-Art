function outim=destripeImage(im,magnitude,fullAuto)
    if (nargin < 3)
        magnitude = 2500;
        fullAuto = 0;
    end
    if fullAuto == 0
        has_angle = 0;
        while has_angle ~= 1
            method = inputdlg('Do you want to destriate manually or auto-detect striation direction? ( M / A )');
            if method{1} == 'M'
                close all
                warning('off','images:initSize:adjustingMag');
                imshow(im);
                disp('Please click on two points on one stripe to identify the direction of striation.');
                [x, y] = ginput(2);
                close all
                angle = atan2(y(2)-y(1),x(2)-x(1))*2*pi;
                has_angle = 1;
            elseif method{1} == 'A'
                angle = detectStriationDirection(im);
                has_angle = 1;
            else
                disp('Please enter a valid response -- M or A');
            end
        end
    else
        angle = detectStriationDirection(im);
    end
    
    disp('Destriating image...');
    tic
    filtim = imfilter(im, fspecial('motion',magnitude,angle), 'replicate');
    outim = im-filtim;
    outim = (outim - min(outim(:)))/range(outim(:));
    toc
    