function bin = gray2bin(gray)
    bin = gray;
    for i = 2:length(gray)
       bin(i) = xor(bin(i-1),gray(i)); 
    end
end