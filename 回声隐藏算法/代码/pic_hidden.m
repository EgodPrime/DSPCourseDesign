clc;clear;
%%
%�����ļ�
[ori_sample,fs]=audioread('AOA.mp3');%������Ƶ
check(ori_sample);
pic=imread('eve.png');%����ˮӡͼƬ
pic=rgb2gray(pic);
%pic=imresize(pic,[21,21]);
pic = double(pic)/255;
subplot(1,2,1);
imshow(pic);%չʾԭͼ

[binpic,shape]=img2bin(pic);%ͼ��ˮӡ�Ķ�������
%%
%��������
es2=encode(binpic,ori_sample(:,1));
%%
%����
binmark2=decode(length(binpic),ori_sample(:,1),es2);
pic2=bin2img(binmark2,shape);
subplot(1,2,2);
imshow(pic2);%չʾԭͼ
%acc=accuracy(binpic,binmark2);
mae = mean(mean(mean(abs(pic-pic2))));
