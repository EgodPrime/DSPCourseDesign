clc;clear;
%%
%�����ļ�
[ori_sample,fs]=audioread('Egotistic.mp3');%������Ƶ
[watermark,fs2]=audioread('Laughs.mp3');%����ˮӡ��Ƶ
watermark=downsample(watermark,3);

pic=imread('timg.jpg');%����ˮӡͼƬ
pic=imresize(pic,[50,50]);
subplot(1,2,1);
imshow(pic);%չʾԭͼ

%binmusic=audio2bin(watermark);%��Ƶˮӡ�Ķ�������
[binpic,shape]=img2bin(pic);%ͼ��ˮӡ�Ķ�������
%%
%��������
%es1=encode(binmusic,ori_sample(1));
es2=encode(binpic,ori_sample(:,1));
%%
%����
%binmark1=decode(binmusic,ori_sample(1),es1);
binmark2=decode(length(binpic),ori_sample(:,1),es2);
pic2=bin2img(binmark2,shape);
subplot(1,2,2);
imshow(pic2);%չʾԭͼ
acc=accuracy(binpic,binmark2);
