function out = IMGencodeTXT(img,txt)
    [D,c] = blockDCT2(img);
    info = txt2bin(txt);
    len = length(info)/8;
    
    if c == 1
       blocks = D.gray;
       [rows8x8,cols8x8] = size(blocks);
       if len > rows8x8*cols8x8
          disp("information is too large for picture!");
          return;
       end
       for i = 1:len
           r = ceil(i/rows8x8);
           c = mod(i,rows8x8);
           blocks{r,c} = encode8x8(blocks{r,c},info(i*8-7,i*8));
       end
       D.gray = blocks;
       out = blockIDCT2(D);
    else
        blocksR = D.r;
        blocksG = D.g;
        blocksB = D.b;
        [rows8x8,cols8x8] = size(blocksR);
        if len > rows8x8*cols8x8*3
          disp("information is too large for picture!");
          return;
        end
        if len <= rows8x8*cols8x8
           for i = 1:len
                r = ceil(i/rows8x8);
                c = mod(i,rows8x8);
                blocksR{r,c} = encode8x8(blocksR{r,c},info(i*8-7:i*8));
           end
           D.r = blocksR;
           out = blockIDCT2(D);
        elseif len > rows8x8*cols8x8 && len <= rows8x8*cols8x8*2
            for i = 1:rows8x8*cols8x8
                r = ceil(i/rows8x8);
                c = mod(i,rows8x8);
                blocksR{r,c} = encode8x8(blocksR{r,c},info(i*8-7:i*8));
            end
            D.r = blocksR;
            for i = 1:rows8x8*cols8x8
                r = ceil(i/rows8x8);
                c = mod(i,rows8x8);
                blocksG{r,c} = encode8x8(blocksG{r,c},info(rows8x8*cols8x8+i*8-7:rows8x8*cols8x8+i*8));
            end
            D.g = blocksG;
            out = blockIDCT2(D);
        else
            for i = 1:rows8x8*cols8x8
                r = ceil(i/rows8x8);
                c = mod(i,rows8x8);
                blocksR{r,c} = encode8x8(blocksR{r,c},info(i*8-7:i*8));
            end
            D.r = blocksR;
            for i = 1:rows8x8*cols8x8
                r = ceil(i/rows8x8);
                c = mod(i,rows8x8);
                blocksG{r,c} = encode8x8(blocksG{r,c},info(rows8x8*cols8x8+i*8-7:rows8x8*cols8x8+i*8));
            end
            D.g = blocksG;
            for i = 1:rows8x8*cols8x8
                r = ceil(i/rows8x8);
                c = mod(i,rows8x8);
                blocksB{r,c} = encode8x8(blocksB{r,c},info(2*rows8x8*cols8x8+i*8-7:2*rows8x8*cols8x8+i*8));
            end
            D.b = blocksB;
            out = blockIDCT2(D);
        end
    end
end