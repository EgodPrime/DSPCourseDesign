function out = IMGencodeIMG(img1,img2)
    
    bin = img2bin(img2); % ���л�������ͼƬ
    
    out = IMGencodeBin(img1,bin);
    
end