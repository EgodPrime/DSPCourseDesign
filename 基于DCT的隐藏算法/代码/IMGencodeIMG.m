function out = IMGencodeIMG(img1,img2)
    
    bin = img2bin(img2); % 序列化被隐藏图片
    bin = [bin;txt2bin('`')]; % 加入结尾标志符
    
    out = IMGencodeBin(img1,bin);
    
end