%��ȡ��Ƶ�ļ���ת�ɵ�����
% [data2,fs]=audioread('C:\Users\lenovo\Desktop\try.wav');
% [~,c] = size(data2);
% if c == 2
%     data2 = data2(:,1) + data2(:,2);
%     data2 = data2 / 2;
% end

data2=data;
%����Ƶ�ĵ�65000��70000����תΪ������
n=1;
for i=65000:70000
    replace2(n,1:32)=voice(data2(i));
    n=n+1;
end

%�Ѻ��λ��ȡ����
for n=1:3420
    restore2(n,1:8)=replace2(n,25:32);
end


shadepix=restore2;
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
%�ָ�Ϊ��ά����
