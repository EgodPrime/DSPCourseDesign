function out = IMGencodeAudio(img,au)
    
    bin = audio2bin(10000*au); % x10000��Ϊ������SNR
    
    out = IMGencodeBin(img,bin);
    
end