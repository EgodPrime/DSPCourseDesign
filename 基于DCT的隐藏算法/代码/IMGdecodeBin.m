% 从图片中提取出二进制码，参数len指的是8x8块的数量
function bin = IMGdecodeBin(img,len)
    D = blockDCT2(img);
    % 获取 高、宽、通道数
    [m,n,c] = size(D);
    rows8x8 = m/8; % 方块行数
    cols8x8 = n/8; % 方块列数
    
    bin = zeros(len*8,1);
    if c==3
        for cnt=1:len
            row = mod(ceil(cnt/cols8x8),rows8x8);
            if row ==0
                row =1;
            end
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            channel = ceil(cnt/rows8x8/cols8x8);
            temp = decode8x8(D(row*8-7:row*8,col*8-7:col*8,channel));
            bin(cnt*8-7:cnt*8) = temp;
        end
    else
        for cnt=1:len
            row = mod(ceil(cnt/cols8x8),rows8x8);
            if row ==0
                row =1;
            end
            col = mod(cnt,cols8x8);
            if col == 0
                col = 1;
            end
            temp = decode8x8(D(row*8-7:row*8,col*8-7:col*8));
            bin(cnt*8-7:cnt*8) = temp;
        end
    end
end