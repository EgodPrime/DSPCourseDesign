function[es2]=pic_hidden(ori_sample,pic)
%%
%导入文件
% [ori_sample,fs]=audioread('AOA.mp3');%导入音频
check(ori_sample);
% pic=imread('eve.png');%导入水印图片
% pic=rgb2gray(pic);
pic = double(pic)/255 ;
% subplot(1,2,1);
% imshow(pic);%展示原图
[binpic,~]=img2bin(pic);%图像水印的二进制码
%%
%回声隐藏
es2=encode(binpic,ori_sample(:,1));
