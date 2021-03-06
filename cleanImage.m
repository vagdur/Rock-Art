function outim=cleanImage(inim,iqrthresh,gaussfilt,withmask,mask)
    disp('Cleaning image...');
    tic
    if(nargin<5)
        iqrthresh = 4;
        gaussfilt = 400;
        withmask = 0;
    end
    outim=inim;
    if (iqrthresh > 0)
        outim(outim>iqrthresh) = iqrthresh;
        outim(outim<(-iqrthresh)) = -iqrthresh;
        outim = (outim+iqrthresh)/(2*iqrthresh);
    end
    if (gaussfilt>0)
        if withmask
            blfilt = fspecial('gaussian',ceil(3.5*gaussfilt),gaussfilt);
            imblur = roifilt2(blfilt,outim,mask);
        else
            imblur = imgaussfilt(outim,gaussfilt);
        end
        hpf = outim-imblur;
        outim = (hpf-min(hpf(:)))/(max(hpf(:))-min(hpf(:)));
    end
    toc
    