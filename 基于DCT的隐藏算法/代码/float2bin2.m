% È·±£±»×ª»»µÄĞ¡Êı½éÓÚ-1ÖÁ1Ö®¼ä£¨²»°üº¬£©

function bin = float2bin2(num)
    bin = zeros(1,8);
    base = 0.5;
    
    if num > 0
        bin(1)=0;
    else
        bin(1)=1;
    end
    
    for i = 2:8
        if num > base
            bin(i) = 1;
            num = num - base;
        else
            bin(i) = 0;
        end
        base = base/2;
    end
    
end