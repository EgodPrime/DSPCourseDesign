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
%% ����8x8���������
disp("����8x8���������")
test_bin = [1 0 0 1 1 1 0 0];
test_mat = randn(8,8);
encoded_mat = encode8x8(test_mat,test_bin);
decoded_bin = decode8x8(encoded_mat);
disp("��������Ϊ:");disp(test_bin);
subplot(1,2,1);imshow(test_mat);title("���Կ�");
subplot(1,2,2);imshow(encoded_mat);title("���ܿ�");
disp("���ܳ���Ϣ:");disp(decoded_bin');
disp("�����������...");pause;
%% �������غͽ����ı���Ϣ
clc;clear;
disp("�����ı���Ϣ����");

% ��ȡͼƬ
img = imread('hasky.jpg');

% ��������ı�
txt = "eve is a super sb hahahaha !";

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