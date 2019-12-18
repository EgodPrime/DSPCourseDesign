function[es2,binpic,shape]=pic_hidden(ori_sample,pic)
%%
%导入文件
% [ori_sample,fs]=audioread('AOA.mp3');%导入音频
% check(ori_sample);
% pic=imread('eve.png');%导入水印图片
pic=rgb2gray(pic);
pic = double(pic)/255 ;
% imshow(pic);%展示原图
[binpic,shape]=img2bin(pic);%图像水印的二进制码
%%
%回声隐藏
es2=encode(binpic,ori_sample);
es2=es2(:);
