function [D,c] = blockDCT2(img)
    D = struct;
    [m,n,c] = size(img);
    rows8x8 = m/8;
    cols8x8 = n/8;
    if c == 3
        for i = 1:c
            rawBlock = blkproc(img(:,:,i),[8,8],'dct2');
            blocks = mat2cell(rawBlock,8*ones(1,rows8x8),8*ones(1,cols8x8));
            if i == 1
                D.r = blocks;
            elseif i == 2
                D.g = blocks;
            else
                D.b = blocks;
            end
        end
    else
        rawBlock = blockproc(img(:,:,i),[8,8],'dct2');
        blocks = mat2cell(rawBlock,8*ones(1,rows8x8),8*ones(1,cols8x8));
        D.gray = blocks;
    end
   
end