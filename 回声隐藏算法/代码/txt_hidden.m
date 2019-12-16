function[es1]=txt_hidden(ori_sample,a)
%导入文件
[ori_sample,fs]=audioread('AOA.mp3');%导入音频
%a='鲁迅认为：practise makes perfect!';%导入txt
bintxt=txt2bin(a);%文字水印的二进制码
%回声隐藏
es1=encode(bintxt,ori_sample(:,1));
end