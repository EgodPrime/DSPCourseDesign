%% ���� myDCT2.m �� myIDCT2.m
clc;clear;
disp("���Զ�ͨ����άDCT��IDCT");

% ��ȡͼƬ
img = imread('hasky.jpg');

% �Ƿ�ʹ�ûҶ�ͼ
isgray = false;
if isgray
    img = rgb2gray(img);
end

% �任����任
g = myDCT2(img);
h = myIDCT2(g);

% ���ͼƬ���ƶ�
ok = mean(mean(mean(h==img)));
fprintf("����DCT�任�͸�ԭǰ���ƽ���������ƶ� ? %f\n",ok);

% ��ͼ�Ƚ�
subplot(2,1,1);
imshow(img);title("ԭʼͼƬ");
subplot(2,1,2);
imshow(h);title("IDCT��ԭͼƬ");

disp("�����������...");pause;
%% �������غͽ����ı���Ϣ
clc;clear;
disp("�����ı���Ϣ����");

% ��ȡͼƬ
img = imread('hasky.jpg');

% ��������ı�
txt = "���Ѿ���¶�ˣ��쳷�ˣ�";

% ������Ϣ
eimg = IMGencodeTXT(img,txt);

% ��ͼ�Ƚ�
subplot(2,1,1);
imshow(img);title("ԭʼͼƬ");
subplot(2,1,2);
imshow(eimg);title("����Ϣ��ͼƬ");

% ����ͼƬ���ƶ�
ok = mean(mean(mean(eimg==img)));
fprintf("���������Ϣǰ���ƽ���������ƶ� ? %f\n",ok);

% ��ȡ��Ϣ
txt = IMGdecodeTXT(eimg);
fprintf("��ȡ����Ϣ��%s\n",txt);

disp("�����������...");pause;
%%
disp("���Խ���");