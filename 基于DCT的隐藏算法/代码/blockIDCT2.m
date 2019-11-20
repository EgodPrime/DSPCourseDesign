function img = blockIDCT2(D)
    [m,n,c] = size(D); % ��ȡ�ߡ���ͨ����
    % �ṩ����
    img = zeros(m,n,c);
    
    fun = @(block_struct) idct2(block_struct.data);
    
    if c == 3 % ��ɫͼ������ͨ���ķֿ鷴dct�任
        img(:,:,1) = blockproc(D(:,:,1),[8,8],fun);
        img(:,:,2) = blockproc(D(:,:,2),[8,8],fun);
        img(:,:,3) = blockproc(D(:,:,3),[8,8],fun);
    else % ��ɫͼֱ�ӽ��зֿ鷴DCT�任
        img = blockproc(D,[8 8],'idct2');
    end
end