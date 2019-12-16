function NCap = calNeedCap(type,shape,methods)
    s = strsplit(shape,' ');
    NCap = 1;
    for i = 1:length(s)
        NCap = NCap * str2double(s{i});
    end
    
    if strcmp(type,'IMG')
        type = 1;
    elseif strcmp(type,'AUDIO')
        type = 2;
    else
        type = 3;
    end
    
    if methods(1)
        if type == 1
            NCap = NCap*4;
        elseif type == 2
            NCap = NCap*12;
        else
            NCap = NCap*8;
        end
    elseif methods(2)
        if type == 1
            NCap = NCap*4;
        elseif type == 2
            NCap = inf;
        else
            NCap = NCap*8;
        end
    else
        if type == 1
            NCap = NCap*4;
        elseif type == 2
            NCap = NCap*8;
        else
            NCap = NCap*8;
        end
    end
end