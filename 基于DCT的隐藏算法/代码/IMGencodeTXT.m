function out = IMGencodeTXT(img,txt)
    % 对输入的img进行分块DCT变换
    out = blockDCT2(img);
    [m,n,c] = size(out);
    info = txt2bin(txt+"`");
    len = length(info)/8; % unicode码字数
    rows8x8 = m/8; % 方块行数
    cols8x8 = n/8; % 方块列数
    fprintf("【TXT信息隐藏过程】可隐藏容量为：%.2fkb\n",m*n*c/8/1024);
    
    if len> rows8x8*cols8x8*c
        disp("information is too large for picture!");
        return;
    end
    
    if c == 3
        for cnt = 1:len
            row = ceil(cnt/cols8x8);
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            channel = ceil(cnt/rows8x8/cols8x8);
            out(row*8-7:row*8,col*8-7:col*8,channel) = encode8x8(out(row*8-7:row*8,col*8-7:col*8,channel),info(cnt*8-7:cnt*8));
        end
    else
         for cnt = 1:len
            if col == 0
                col = 1;
            end
            row = ceil(cnt/cols8x8);
            col = mod(cnt,cols8x8);
            out(row*8-7:row*8,col*8-7:col*8) = encode8x8(out(row*8-7:row*8,col*8-7:col*8),info(cnt*8-7:cnt*8));
         end
    end
    
    out = blockIDCT2(out);
end