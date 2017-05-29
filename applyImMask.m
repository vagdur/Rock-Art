function imout=applyImMask(im,mask)
    imout = im.*mask + (1-mask)*mean(im(:));