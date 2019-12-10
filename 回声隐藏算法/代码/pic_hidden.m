clc;clear;
%%
%导入文件
[ori_sample,fs]=audioread('AOA.mp3');%导入音频
check(ori_sample);
pic=imread('eve.png');%导入水印图片
pic=rgb2gray(pic);
%pic=imresize(pic,[21,21]);
pic = double(pic)/255;
subplot(1,2,1);
imshow(pic);%展示原图

[binpic,shape]=img2bin(pic);%图像水印的二进制码
%%
%回声隐藏
es2=encode(binpic,ori_sample(:,1));
%%
%解码
binmark2=decode(length(binpic),ori_sample(:,1),es2);
pic2=bin2img(binmark2,shape);
subplot(1,2,2);
imshow(pic2);%展示原图
%acc=accuracy(binpic,binmark2);
mae = mean(mean(mean(abs(pic-pic2))));
