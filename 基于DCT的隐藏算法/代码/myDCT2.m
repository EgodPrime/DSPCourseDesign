%% 支持三通道的二维DCT
function [X] = myDCT2(img)
    [h,w,c] = size(img);
    if c == 3
        X = zeros(h,w,c);
        for i = 1:c
           X(:,:,i) = dct2(img(:,:,i));
        end
    else
        X = dct2(img);
    end
end