function [bin,shape] = img2bin(img)
    img=double(img);
    [h,w,channel] = size(img);
    shape = [h,w,channel];
    seq = img(:);
    if max(seq) < 2
        seq = seq*255;
    end
    bin = zeros(h*w*channel*3,1);
    for i = 1:h*w*channel
        temp = uint82bin(seq(i));
        bin(i*4-3:i*4) = bin2gray(temp(1:4));
    end
end