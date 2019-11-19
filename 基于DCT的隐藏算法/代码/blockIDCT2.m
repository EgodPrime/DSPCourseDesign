function img = blockIDCT2(D)
    c = length(fieldnames(D)); % 获取颜色通道数
    % 提供容器
    if c == 1 % 灰色图
        rawBlocks = cell2mat(D.gray);% cell转换为完整的矩阵
        [m,n] = size(rawBlocks);
        img = zeros(m,n);
    else % 彩色图
        rawBlocksR = cell2mat(D.r);
        rawBlocksG = cell2mat(D.g);
        rawBlocksB = cell2mat(D.b);
        [m,n] = size(rawBlocksB);
        img = zeros(m,n,c);
    end
    if c == 3 % 彩色图进行三通道的分块反dct变换
        img(:,:,1) = blkproc(rawBlocksR,[8,8],'idct2');
        img(:,:,2) = blkproc(rawBlocksG,[8,8],'idct2');
        img(:,:,3) = blkproc(rawBlocksB,[8,8],'idct2');
    else % 灰色图直接进行分块反DCT变换
        img = blkproc(rawBlocks,[8 8],'idct2');
    end
    img = uint8(img);
end