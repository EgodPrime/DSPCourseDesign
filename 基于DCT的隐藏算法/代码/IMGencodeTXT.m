function out = IMGencodeTXT(img,txt)

    info = txt2bin(txt+"`");
    
    out = IMGencodeBin(img,info);
    
end