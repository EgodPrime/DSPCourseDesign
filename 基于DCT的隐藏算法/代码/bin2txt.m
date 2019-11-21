function txt = bin2txt(bin)
    t = reshape(bin,8,[]);
    t = t';
    r = size(t,1);
    for i = 1:r
       for j = 1:8
          txt(i,j) =  num2str(t(i,j));
       end
    end
    txt = bin2dec(txt);
    txt = native2unicode(txt');
end