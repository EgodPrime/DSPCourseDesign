function bin = float2bin(num)
    a = single(num);
    b = num2hex(a);
    c = hexToBinaryVector(b,32);
    bin = c;
end