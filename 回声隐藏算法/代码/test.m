clc;clear;

disp("导入原音频！");
[ori_sample,fs]=audioread('凉凉.mp3');%导入音频
ori_sample = ori_sample(:,1);
check(ori_sample);
disp("播放原音频,按任意键停止播放。");
sound(ori_sample,fs);
pause();
clear sound;
%%
disp("测试隐藏文本功能:");
disp("测试文本消息为");

a = "鲁迅又名周树人，To be or not to be,that is a question 富强民主，文明和谐"; 
disp(a);
[es1,bintxt]= txt_hidden(ori_sample,a);
disp("嵌入数据完毕……");
disp("播放嵌入信息后的音频，按任意键停止播放。");
sound(es1,fs);
pause();
clear sound;
disp("提取文本后结果：");
b = txt_rebuild(bintxt,ori_sample,es1);
disp(b); 

disp("___________________________");
disp("按任意键继续。");
pause();
%%
disp("测试隐藏图片功能:");
disp("测试图片消息为"); 
 
pic=imread('eve.png');%导入水印图片
% pic = downsample(pic,5);
subplot(1,2,1);
imshow(pic);%展示原图

[es2,binpic,shape]= pic_hidden(ori_sample,pic);
disp("嵌入图片完毕……");
disp("播放嵌入信息后的音频，按任意键停止播放。");
sound(es2,fs);
pause();
clear sound;
disp("提取图片后结果：");
pic2 = img_rebuild(binpic,ori_sample,es2,shape);
subplot(1,2,2);
imshow(pic2);
disp("___________________________");
disp("按任意键继续。");
pause();
%%
%尝试将原音频进行还原
disp("将原音频进行文本还原");
c = txt_rebuild(bintxt,ori_sample,ori_sample);
disp("c的内容："); 
disp(c);
disp("按任意键继续。");
pause();
disp("将原音频进行图像还原");
d = img_rebuild(binpic,ori_sample,ori_sample,shape); 
disp("提取图片后结果：");
figure;
imshow(d);
