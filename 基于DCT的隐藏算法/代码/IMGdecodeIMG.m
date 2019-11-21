function out = IMGdecodeIMG(img,shape)

    bin = IMGdecodeBin(img,shape(1)*shape(2)*shape(3)/2);
    out = bin2img(bin,shape);
end