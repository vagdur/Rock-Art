function outim=cleanImage(inim,iqrthresh,gaussfilt)
    disp('Cleaning image...');
    tic
    if(nargin<2)
        iqrthresh = 4;
        gaussfilt = 400;
    end
    outim=inim;
    outim(outim>iqrthresh) = iqrthresh;
    outim(outim<(-iqrthresh)) = -iqrthresh;
    outim = (outim+iqrthresh)/(2*iqrthresh);
    if (gaussfilt>0)
        imblur = imgaussfilt(outim,gaussfilt);
        hpf = outim-imblur;
        outim = (hpf-min(hpf(:)))/(max(hpf(:))-min(hpf(:)));
    end
    toc
    