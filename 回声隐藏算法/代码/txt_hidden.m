clc;clear;

%��Ҫ��һ����Ƶ�ı��뷽ʽ
%%
%�����ļ�
[ori_sample,fs]=audioread('AOA.mp3');%������Ƶ
a='³Ѹ��Ϊ��practise makes perfect!';%����txt
disp(a);
% [watermark,fs2]=audioread('Laughs.mp3');%����ˮӡ��Ƶ
% watermark=downsample(watermark,3);

bintxt=txt2bin(a);%����ˮӡ�Ķ�������
%%
%��������
es1=encode(bintxt,ori_sample(:,1));
%%
%����
binmark=decode(length(bintxt),ori_sample(:,1),es1);
disp(bin2txt(binmark));
% binmark2=decode(length(binpic),ori_sample(:,1),es2);
% pic2=bin2img(binmark2,shape);
% subplot(1,2,2);
% imshow(pic2);%չʾԭͼ
% acc=accuracy(binpic,binmark2);
% mae = mean(mean(mean(abs(pic-pic2))));