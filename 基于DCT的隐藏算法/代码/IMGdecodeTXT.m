function out = IMGdecodeTXT(img)
    % 获取 块胞 和 通道数
    [D,c] = blockDCT2(img);
    % 获取尺寸
    if c == 1
       info = [];
       blocks = D.gray;
       [rows8x8,cols8x8] = size(blocks); 
       for i = rows8x8
            for j = cols8x8
                info = [info;decode8x8(blocks{i,j})];
            end
       end
       out = bin2txt(info);
    else
        blocksR = D.r;
        blocksG = D.g;
        blocksB = D.b;
        [rows8x8,cols8x8] = size(blocksR);
        info = [];
        for i = rows8x8
            for j = cols8x8
                info = [info;decode8x8(blocksR{i,j})];
            end
        end
        for i = rows8x8
            for j = cols8x8
                info = [info;decode8x8(blocksG{i,j})];
            end
        end
        for i = rows8x8
            for j = cols8x8
                info = [info;decode8x8(blocksB{i,j})];
            end
        end
        out = bin2txt(info);
    end
end