function out = IMGencodeBin(img,bin)
    [h,w,c] = size(img);
    len = length(bin)/8;
    
    if h*w*c/8 < len
        disp("被隐藏信息相对于宿主图片太大！");
        return;
    end
    
    rows8x8 = h/8; % 方块行数
    cols8x8 = w/8; % 方块列数
    out = blockDCT2(img);
    
    if c == 3
        for cnt = 1:len
            row = mod(ceil(cnt/cols8x8),rows8x8);
            if row ==0
                row =1;
            end
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            channel = ceil(cnt/rows8x8/cols8x8);
            out(row*8-7:row*8,col*8-7:col*8,channel) = encode8x8(out(row*8-7:row*8,col*8-7:col*8,channel),bin(cnt*8-7:cnt*8));
        end
    else
         for cnt = 1:len
            row = ceil(cnt/cols8x8);
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            out(row*8-7:row*8,col*8-7:col*8) = encode8x8(out(row*8-7:row*8,col*8-7:col*8),bin(cnt*8-7:cnt*8));
         end
    end
    
    out = blockIDCT2(out);
end