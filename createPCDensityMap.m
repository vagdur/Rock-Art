function densmap=createPCDensityMap(pc)
    pc = pc - min(pc) + 1;
    pc = ceil(pc);
    maxs = max(pc);
    xmax = maxs(1); ymax = maxs(2);
    densmap = zeros([xmax ymax]);
    
    for i = 1:1:size(pc,1)
        densmap(pc(i,1),pc(i,2)) = densmap(pc(i,1),pc(i,2)) + 1;
    end
    