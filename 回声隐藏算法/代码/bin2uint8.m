function num = bin2uint8(bin)
    num = 0;
    base = 2^7;
    for i = 1:8
        num = num+base*bin(i);
        base = base/2;
    end
end