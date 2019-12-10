function gray = bin2gray(bin)
    gray = bin;    
    for i = 2:length(bin)
            gray(i) = xor(bin(i-1),bin(i));
    end
end