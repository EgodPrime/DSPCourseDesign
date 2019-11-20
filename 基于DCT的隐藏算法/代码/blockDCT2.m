function D = blockDCT2(img)
    [m,n,c] = size(img); % ��ȡ�ߣ���ͨ����
    D = zeros(m,n,c);
    
    fun = @(block_struct) dct2(block_struct.data);
    
    if c == 3 % ��ɫ
        for i = 1:3
            rawBlock = blockproc(img(:,:,i),[8,8],fun);
            if i == 1
                D(:,:,1) = rawBlock;
            elseif i == 2
                D(:,:,2) = rawBlock;
            else
                D(:,:,3) = rawBlock;
            end
        end
    else % ��ɫ
        D = blockproc(img,[8,8],'dct2');
    end
end