function outim=destriateAngle(im,angle,magnitude,withmask,mask)
    if nargin<3
        magnitude = 2500;
        withmask = 0;
    end
    if nargin<2
        error('Need to specify an angle to destriate');
    end
    if withmask
        filtim = roifilt2(fspecial('motion',magnitude,angle),im,mask);
    else
        filtim = imfilter(im, fspecial('motion',magnitude,angle), 'replicate');
    end
    outim = im-filtim;
    outim = (outim - min(outim(:)))/range(outim(:));