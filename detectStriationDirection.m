function angle=detectStriationDirection(im)
    disp('Detecting striation direction...');
    tic
    thr = adaptthresh(im,0.55);
    bind = imbinarize(im,thr);
    bigcomps = bwareaopen(bind,1500);
    houghd = hough(bigcomps);
    peaks = houghpeaks(houghd,8);
    peaks = peaks(:,2);
    peaks(peaks>90) = 180 - peaks(peaks>90);
    angle = mod(mean(peaks),180);
    disp(['Detected striation angle: ',num2str(round(angle,3))]);
    toc
    
    
    