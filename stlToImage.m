function [image,convhull]=stlToImage(filepath)
    disp(['Loading ',filepath,'...']);
    tic
    [~,pc] = stlread(filepath);
    pc = unique(pc,'rows');
    [image,convhull] = csvToImage(pc,1);
    toc
    beep