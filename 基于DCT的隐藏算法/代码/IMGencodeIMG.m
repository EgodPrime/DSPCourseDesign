function out = IMGencodeIMG(img1,img2)
    
    bin = img2bin(img2); % ���л�������ͼƬ
    bin = [bin;txt2bin('`')]; % �����β��־��
    
    out = IMGencodeBin(img1,bin);
    
end