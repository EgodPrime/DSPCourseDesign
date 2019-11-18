function img = blockIDCT2(D)
    c = length(fieldnames(D));
    if c == 1
        rawBlocks = cell2mat(D.gray);
        [m,n] = size(rawBlocks);
        img = zeros(m,n);
    else
        rawBlocksR = cell2mat(D.r);
        rawBlocksG = cell2mat(D.g);
        rawBlocksB = cell2mat(D.b);
        [m,n] = size(rawBlocksB);
        img = zeros(m,n,c);
    end
    if c == 3
        img(:,:,1) = blkproc(rawBlocksR,[8,8],'idct2');
        img(:,:,2) = blkproc(rawBlocksG,[8,8],'idct2');
        img(:,:,3) = blkproc(rawBlocksB,[8,8],'idct2');
    else
        img = blkproc(rawBlocks,[8 8],'idct2');
    end
    img = uint8(img);
end