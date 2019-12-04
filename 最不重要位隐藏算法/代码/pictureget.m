
[hang,lie]=size(shadepix);
decpixline=zeros(hang,1);
for i=1:hang
    for j=1:8
        decpixline(i)=decpixline(i)+shadepix(i,j)*2^(8-j);
    end
end

decpix=reshape(decpixline,record(1),record(2),3);
decpix=uint8(decpix);
imwrite(decpix,'C:\Users\lenovo\Desktop\789.jpg');
%»Ö¸´ÎªÈýÎ¬¾ØÕó
