function[es2,binpic,shape]=pic_hidden(ori_sample,pic)
%%
%�����ļ�
% [ori_sample,fs]=audioread('AOA.mp3');%������Ƶ
% check(ori_sample);
% pic=imread('eve.png');%����ˮӡͼƬ
pic=rgb2gray(pic);
pic = double(pic)/255 ;
% imshow(pic);%չʾԭͼ
[binpic,shape]=img2bin(pic);%ͼ��ˮӡ�Ķ�������
%%
%��������
es2=encode(binpic,ori_sample);
es2=es2(:);
