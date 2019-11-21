function bin = IMGdecodeBin(img,len)
    D = blockDCT2(img);
    % ��ȡ �ߡ���ͨ����
    [m,n,c] = size(D);
    rows8x8 = m/8; % ��������
    cols8x8 = n/8; % ��������
    
    bin = [];
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
            bin = [bin;temp];
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
            bin = [bin;temp];
        end
    end
end