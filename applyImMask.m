function imout=applyImMask(im,mask,smoothening)
    if nargin < 2
        smoothening = 20;
    end
    if smoothening
        mask = imgaussfilt(mask,smoothening);
    end
    imout = im.*mask + (1-mask)*mean(im(:));