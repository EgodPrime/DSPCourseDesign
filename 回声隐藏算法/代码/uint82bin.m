function bin = uint82bin(num)
    base = 2^7;
    bin = zeros(4,1);
    for i = 1:8
       f = floor(num/base);
       bin(i) = f;
       num = num-f*base;
       base = base/2;
    end
end