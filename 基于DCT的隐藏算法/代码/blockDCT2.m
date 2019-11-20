function D = blockDCT2(img)
    [m,n,c] = size(img); % 获取高，宽，通道数
    D = zeros(m,n,c);
    
    fun = @(block_struct) dct2(block_struct.data);
    
    if c == 3 % 彩色
        for i = 1:3
            rawBlock = blockproc(img(:,:,i),[8,8],fun);
            if i == 1
                D(:,:,1) = rawBlock;
            elseif i == 2
                D(:,:,2) = rawBlock;
            else
                D(:,:,3) = rawBlock;
            end
        end
    else % 灰色
        D = blockproc(img,[8,8],'dct2');
    end
end