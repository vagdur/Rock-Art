function outim=destriateAngle(im,angle,magnitude)
    if nargin<3
        magnitude = 2500;
    end
    if nargin<2
        error('Need to specify an angle to destriate');
    end
   
    filtim = imfilter(im, fspecial('motion',magnitude,angle), 'replicate');
    outim = im-filtim;
    outim = (outim - min(outim(:)))/range(outim(:));