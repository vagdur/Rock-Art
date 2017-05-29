function outim=cleanImage(inim,iqrthresh,gaussfilt)
    disp('Cleaning image...');
    tic
    if(nargin<2)
        iqrthresh = 4;
        gaussfilt = 400;
    end
    outim=inim;
    if (iqrthresh > 0)
        outim(outim>iqrthresh) = iqrthresh;
        outim(outim<(-iqrthresh)) = -iqrthresh;
        outim = (outim+iqrthresh)/(2*iqrthresh);
    end
    if (gaussfilt>0)
        imblur = imgaussfilt(outim,gaussfilt);
        hpf = outim-imblur;
        outim = (hpf-min(hpf(:)))/(max(hpf(:))-min(hpf(:)));
    end
    toc
    