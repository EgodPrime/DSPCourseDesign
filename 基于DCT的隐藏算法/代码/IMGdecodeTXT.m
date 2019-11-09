function out = IMGencodeTXT(img)
    X = myDCT2(img);
    X = mod(X,2);
    X = X(:);
    out = bin2txt(X);
end


function txt = bin2txt(bin)
    t = reshape(bin,[],8);
    t(all(t==0,2))=[];
    r = size(t,1);
    txt = char(r,8);
    for i = 1:r
       for j = 1:8
          txt(i,j) =  num2str(t(i,j));
       end
    end
end