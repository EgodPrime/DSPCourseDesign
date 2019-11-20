function out = IMGdecodeTXT(img)
    D = blockDCT2(img);
    % 获取 高、宽、通道数
    [m,n,c] = size(D);
    rows8x8 = m/8; % 方块行数
    cols8x8 = n/8; % 方块列数
    
    out = string;
    cnt = 1;
    if c==3
        while true
            row = ceil(cnt/cols8x8);
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            channel = ceil(cnt/rows8x8/cols8x8);
            temp = decode8x8(D(row*8-7:row*8,col*8-7:col*8,channel));
            temp = bin2txt(temp);
            if temp == "`"
                break;
            end
            out = out + temp;
            cnt = cnt+1;
        end
    else
        while true
            row = ceil(cnt/cols8x8);
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            temp = decode8x8(D(row*8-7:row*8,col*8-7:col*8));
            temp = bin2txt(temp);
            if temp == "`"
                break;
            end
            out = out + temp;
            cnt = cnt+1;
        end
    end
end