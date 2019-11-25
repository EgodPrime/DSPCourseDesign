% 支持单声道，若输入双声道，自动转换为单声道
function bin = audio2bin(au)
    if size(au,2) == 2
        au = mean(au,2);
    end
    
    len = length(au);
    bin = zeros(len*16,1);
    
    for i = 1:len
       temp = float2bin(au(i));
       bin(i*16-15:i*16) = temp(1:16);
    end
end