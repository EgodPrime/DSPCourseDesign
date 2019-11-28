function num = bin2float2(bin)
    num = 0;
    base= 0.5;
    
    if bin(1) > 0
       sign = 1; 
    else 
       sign = -1;
    end
    
    for i = 2:8
       num = num + base*bin(i); 
       base = base/2;
    end
    
    num = sign*num;
end