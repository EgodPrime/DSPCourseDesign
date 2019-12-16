function cap = calcuCapacity(shape,methods)
    s = strsplit(shape,' ');
    cap = 1;
    for i = 1:length(s)
        cap = cap * str2double(s{i});
    end
    
    if methods(1)
        cap = cap*4;
    elseif methods(2)
        cap = cap/2000;
    else
        cap = cap/8;
    end
end