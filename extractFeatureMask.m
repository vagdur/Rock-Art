function filted=extractFeatureMask(im,mode,areathresh,imsmoothing,dilation,filtsmoothing)
    if nargin == 1
        mode = 'apply';
        areathresh = 120000;
        imsmoothing = 20;
        dilation = 400;
        filtsmoothing = 250;
    end
    smoothed = imgaussfilt(im,imsmoothing);
    binary = bwareaopen(imbinarize(smoothed,'adaptive'),areathresh);
    binary = imdilate(binary,true(dilation));
    smoothmask = imgaussfilt(double(binary),filtsmoothing);
    if strcmp(mode,'sharpmask')
        filted = binary;
    elseif strcmp(mode,'smoothmask')
        filted = smoothmask;
    else
        filted = (im-mean(im(:))).*smoothmask;
        filted = 1 - filted/max(filted(:));
    end
    
    
    
    