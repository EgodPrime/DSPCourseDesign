clc;clear;

%需要改一下音频的编码方式
%%
%导入文件
[ori_sample,fs]=audioread('AOA.mp3');%导入音频
a='鲁迅认为：practise makes perfect!';%导入txt
disp(a);
% [watermark,fs2]=audioread('Laughs.mp3');%导入水印音频
% watermark=downsample(watermark,3);

bintxt=txt2bin(a);%文字水印的二进制码
%%
%回声隐藏
es1=encode(bintxt,ori_sample(:,1));
%%
%解码
binmark=decode(length(bintxt),ori_sample(:,1),es1);
disp(bin2txt(binmark));
% binmark2=decode(length(binpic),ori_sample(:,1),es2);
% pic2=bin2img(binmark2,shape);
% subplot(1,2,2);
% imshow(pic2);%展示原图
% acc=accuracy(binpic,binmark2);
% mae = mean(mean(mean(abs(pic-pic2))));