function[es1]=txt_hidden(ori_sample,a)
%�����ļ�
[ori_sample,fs]=audioread('AOA.mp3');%������Ƶ
%a='³Ѹ��Ϊ��practise makes perfect!';%����txt
bintxt=txt2bin(a);%����ˮӡ�Ķ�������
%��������
es1=encode(bintxt,ori_sample(:,1));
end