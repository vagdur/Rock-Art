function pc=plyToPointcloud(filepath)
    pc = pcread(filepath);
    pc = pc.Location;