function flat=flattenRockSurface(raw)
    warning('off','curvefit:fit:equationBadlyConditioned');
    [~, score] = pca(raw);
    [~,~, output] = fit([score(:,1) score(:,2)], score(:,3),'poly55');
    r = output.residuals;
    r = r/iqr(r);
    flat = horzcat(score(:,1),score(:,2),r);
    warning('on','curvefit:fit:equationBadlyConditioned');
    
    
    