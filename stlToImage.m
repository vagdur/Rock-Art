function image=stlToImage(filepath)
    disp(['Loading ',filepath,'...']);
    tic
    [~,pc] = stlread(filepath);
    pc = unique(pc,'rows');
    image = csvToImage(pc,1);
    toc
    beep