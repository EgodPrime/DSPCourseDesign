function out = IMGencodeAudio(img,au)
    
    bin = audio2bin2(10000*au); % x10000是为了增加SNR
    
    out = IMGencodeBin(img,bin);
    
end