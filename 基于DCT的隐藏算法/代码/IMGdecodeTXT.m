function out = IMGdecodeTXT(img)

    bin = IMGdecodeBin(img,1024);
    out = bin2txt(bin);
    out = string(out);
    temp = split(out,'`');
    out = temp(1);
    
end