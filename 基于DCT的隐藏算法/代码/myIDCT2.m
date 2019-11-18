%% 支持三通道的二维IDCT
function [img] = myIDCT2(X)
    [h,w,c] = size(X);
    if c == 3
        img = zeros(h,w,c);
        for i = 1:c
           img(:,:,i) = idct2(X(:,:,i));
        end
    else
        img = idct2(X);
    end
    img = uint8(img);
end