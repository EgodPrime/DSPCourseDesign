function num = bin2float(bin)
    bin = reshape(bin,1,[]);
    sign = bin(1);
    e = binaryVectorToDecimal(bin(2:9))-127;
    f = bin(10:end);
    
    % 符号
    if sign == 0
        sign = 1;
    else
        sign = -1;
    end
    
    % 指数幂后值
    e = power(2,e);
    
    num = 1;
    base = 0.5;
    for i = 1:length(f)
        num = num+base*f(i);
        base = base/2;
    end
    
    num = sign * num * e;
end