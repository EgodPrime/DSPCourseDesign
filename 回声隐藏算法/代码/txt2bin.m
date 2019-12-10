function bin = txt2bin(txt)
    t = unicode2native(txt);
    t = dec2bin(t,8);
    [r,~] = size(t);
    bin = zeros(r*8,1);
    for i = 0:r-1
       for j = 1:8
           bin(i*8+j) = str2double(t(i+1,j));
       end
    end
end