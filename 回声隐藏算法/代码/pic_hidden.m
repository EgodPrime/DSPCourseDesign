function[es2]=pic_hidden(ori_sample,pic)
%%
%�����ļ�
% [ori_sample,fs]=audioread('AOA.mp3');%������Ƶ
check(ori_sample);
% pic=imread('eve.png');%����ˮӡͼƬ
% pic=rgb2gray(pic);
pic = double(pic)/255 ;
% subplot(1,2,1);
% imshow(pic);%չʾԭͼ
[binpic,~]=img2bin(pic);%ͼ��ˮӡ�Ķ�������
%%
%��������
es2=encode(binpic,ori_sample(:,1));
