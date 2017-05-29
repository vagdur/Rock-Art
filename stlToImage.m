function [image,convhull,dmask]=stlToImage(filepath)
    disp(['Loading ',filepath,'...']);
    tic
    [~,pc] = stlread(filepath);
    pc = unique(pc,'rows');
    [image,convhull,dmask] = csvToImage(pc,1);
    toc
    beep