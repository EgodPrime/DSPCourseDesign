function au = bin2audio(bin)
    len = length(bin)/16;
    
    au = zeros(len,1);
    
    for i = 1:len
        au(i) = bin2float(bin(i*16-15:i*16)');
    end
end