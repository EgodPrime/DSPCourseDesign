clear all;
pix=imread('C:\Users\lenovo\Desktop\123.jpg');
pix=imresize(pix,0.04);
pix=double(pix);
%��ȡͼƬ������ֵ��a*b*3��


record=size(pix);
%��¼���ؾ���Ĺ��
pix1=reshape(pix(:,:,1),[],1)';
pix2=reshape(pix(:,:,2),[],1)';
pix3=reshape(pix(:,:,3),[],1)';
pixline=[pix1,pix2,pix3]';
%��ά����תΪ������

for i=1:length(pixline)
    binpixline=str2num(dec2bin(pixline));
end
%ʮ����תΪ2����

for i=1:length(binpixline)
    bbb=num2str(binpixline(i));
    for j=1:length(bbb)
        if(length(bbb)<8)
            shadepix(1:8-length(bbb))=0;
            shadepix(i,8-length(bbb)+j)=str2num(bbb(j));
        else
            shadepix(i,j)=str2num(bbb(j));
        end
    end
end
%ͼ������תΪ8�е������滻��Ƶ���ݵĺ��λ
  
        