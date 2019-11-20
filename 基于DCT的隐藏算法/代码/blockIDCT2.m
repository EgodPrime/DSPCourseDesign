function img = blockIDCT2(D)
    [m,n,c] = size(D); % 获取高、宽、通道数
    % 提供容器
    img = zeros(m,n,c);
    
    fun = @(block_struct) idct2(block_struct.data);
    
    if c == 3 % 彩色图进行三通道的分块反dct变换
        img(:,:,1) = blockproc(D(:,:,1),[8,8],fun);
        img(:,:,2) = blockproc(D(:,:,2),[8,8],fun);
        img(:,:,3) = blockproc(D(:,:,3),[8,8],fun);
    else % 灰色图直接进行分块反DCT变换
        img = blockproc(D,[8 8],'idct2');
    end
end