function out = IMGencodeTXT(img,txt)
    X = myDCT2(img);
    [h,w,c] = size(X);
    bin = txt2bin(txt);
    if(length(bin)>h*w*c)
        fprintf("the msg is too large for this picture!\n");
        return;
    end
    X = X-mod(X,2);
    X = X(:);
    X(1:length(bin))= X(1:length(bin))+bin;
    X = reshape(X,h,w,c);
    out = myIDCT2(X);
end

function bin = txt2bin(txt)
    t = unicode2native(txt);
    t = dec2bin(t,8);
    [r,~] = size(t);
    bin = zeros(r*8,1);
    for i = 0:r-1
       for j = 1:8
           bin(i*8+j) = str2double(t(i+1,j));
       end
    end
end