function imout=applyImMask(im,mask,smoothening)
    if nargin < 2
        error('Need to supply both image and mask');
    end
    if ~isequal(size(im),size(mask))
        error('Image and mask dimensions do not match');
    end
    if nargin < 3
        smoothening = 200;
    end
    if smoothening>0
        mask = imgaussfilt(imerode(mask,true(smoothening/2)),smoothening);
    end
    imout = im.*mask + (1-mask)*mean(im(:));