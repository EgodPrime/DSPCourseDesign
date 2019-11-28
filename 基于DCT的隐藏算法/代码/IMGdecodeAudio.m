function au = IMGdecodeAudio(img,len)

    bin = IMGdecodeBin(img,len*2);
    
    au = bin2audio(bin)/10000;
    
end