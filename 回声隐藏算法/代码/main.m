clc;clear;
%%
%导入文件
[ori_sample,fs]=audioread('Egotistic.mp3');%导入音频
[watermark,fs2]=audioread('Laughs.mp3');%导入水印音频
watermark=downsample(watermark,3);

pic=imread('timg.jpg');%导入水印图片
pic=imresize(pic,[50,50]);
subplot(1,2,1);
imshow(pic);%展示原图

%binmusic=audio2bin(watermark);%音频水印的二进制码
[binpic,shape]=img2bin(pic);%图像水印的二进制码
%%
%回声隐藏
%es1=encode(binmusic,ori_sample(1));
es2=encode(binpic,ori_sample(:,1));
%%
%解码
%binmark1=decode(binmusic,ori_sample(1),es1);
binmark2=decode(length(binpic),ori_sample(:,1),es2);
pic2=bin2img(binmark2,shape);
subplot(1,2,2);
imshow(pic2);%展示原图
acc=accuracy(binpic,binmark2);
