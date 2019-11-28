%% ���� myDCT2.m �� myIDCT2.m
clc;clear;
disp("���Զ�ͨ���ֿ��άDCT��IDCT");

% ��ȡͼƬ
img = imread('hasky.jpg');
img = double(img);
img = img/255;

% �Ƿ�ʹ�ûҶ�ͼ
isgray = false;
if isgray
    img = rgb2gray(img);
end

% �任����任
disp("�������任...");
g = blockDCT2(img);
disp("������任...");
h = blockIDCT2(g);

% ���ͼƬ���ƶ�
diff = abs(h-img);
ok = mean(mean(mean(diff<3*eps)));
fprintf("�����Զ�ͨ���ֿ�DCT2�任��DCT2����ԭǰ��ƽ���������ƶ�(+-3eps) ? %.2f\n",ok);

% ��ͼ�Ƚ�
subplot(2,1,1);
imshow(img);title("ԭʼͼƬ");
subplot(2,1,2);
imshow(h);title("IDCT��ԭͼƬ");

disp("����ͨ���������������...");pause;
%% ����8x8���������
disp("����8x8���������")
test_bin = [1 0 0 1 1 1 0 0];
test_mat = randn(8,8);
test_Dmat = dct2(test_mat);
encoded_Dmat = encode8x8(test_Dmat,test_bin);
encoded_mat = idct2(encoded_Dmat);
decoded_bin = decode8x8(dct2(encoded_mat));
disp("��������Ϊ:");disp(test_bin);
subplot(2,2,1);imshow(test_mat);title("���Կ�");
subplot(2,2,2);imshow(test_Dmat);title("���Կ�DCT");
subplot(2,2,3);imshow(encoded_Dmat);title("���ܿ�DCT");
subplot(2,2,4);imshow(test_Dmat==encoded_Dmat);title("����ǰ����ͬ");
disp("���ܳ���Ϣ:");disp(decoded_bin');

disp("����ͨ���������������...");pause;
%% �������غͽ����ı���Ϣ
clc;clear;
disp("�����ı���Ϣ����");

% ��ȡͼƬ
img = imread('hasky.jpg');
img = double(img);
img = img/255;

% ��������ı�
txt = "���׺�˵��life is strugle but it's fair.";
disp("������ϢΪ:");disp(txt);

% ������Ϣ
disp("��ʼǶ����Ϣ...");
eimg = IMGencodeTXT(img,txt);

% ��ͼ�Ƚ�
subplot(2,1,1);
imshow(img);title("ԭʼͼƬ");
subplot(2,1,2);
imshow(eimg);title("����Ϣ��ͼƬ");

% ����ͼƬ���ƶ�
diff = abs(eimg-img);
ok = mean(mean(mean(diff<5*eps)));
fprintf("������TXT��Ϣ���ء����������Ϣǰ���ƽ���������ƶ�(+-5eps) ? %.2f\n",ok);

% ��ȡ��Ϣ
disp("��ʼ��ȡ��Ϣ...");
txt = IMGdecodeTXT(eimg);
fprintf("��ȡ����Ϣ��%s\n",txt);

disp("����ͨ���������������...");pause;
%% ����ͼƬ����ͼƬ
clc;clear;
disp("����ͼƬ����ͼƬ");

% ��ȡͼƬ
img = imread('hasky.jpg');
img = double(img);
img1 = img/255;

img = imread('fox.jpg');
img = imresize(img,0.5);
img = double(img);
img2 = img/255;

% ͼƬ����ͼƬ
disp("��ʼǶ����Ϣ...");
img3 = IMGencodeIMG(img1,img2);

diff = abs(img3-img1);
ok = mean(mean(mean(diff<5*eps)));
fprintf("������ͼƬ����ͼƬ�����������Ϣǰ���ƽ���������ƶ�(+-5eps) ? %.2f\n",ok);

% ��ȡͼƬ
disp("��ʼ��ȡ��Ϣ...");
img4 = IMGdecodeIMG(img3,size(img2));

subplot(2,2,1);imshow(img1);title("����ͼƬ");
subplot(2,2,2);imshow(img2);title("������ͼƬ");
subplot(2,2,3);imshow(img3);title("����ϢͼƬ");
subplot(2,2,4);imshow(img4);title("��ȡ����ͼƬ");

disp("����ͨ���������������...");pause;
%% ����ͼƬ��������
clc;clear;
disp("����ͼƬ��������");

% ��ȡͼƬ
img = imread('hasky.jpg');
img = double(img);
img = img/255;
% ��ȡ����
[au,fs] = audioread('����.mp3');

disp("���������ԭ����...");pause;
sound(au,fs);

disp("��ʼǶ����Ϣ...");
eimg = IMGencodeAudio(img,au);

% ��ͼ�Ƚ�
subplot(2,1,1);
imshow(img);title("ԭʼͼƬ");
subplot(2,1,2);
imshow(eimg);title("����Ϣ��ͼƬ");

% ����ͼƬ���ƶ�
diff = abs(eimg-img);
ok = mean(mean(mean(diff<5*eps)));
fprintf("������������Ϣ���ء����������Ϣǰ���ƽ���������ƶ�(+-5eps) ? %.2f\n",ok);
 
disp("��ʼ��ȡ��Ϣ...");
au_r = IMGdecodeAudio(eimg,length(au));
au_r(abs(au_r)>0.5)=0;

disp("����������ָ�����...");pause;
sound(au_r,fs);

disp("����ͨ���������������...");pause;
%%
disp("���Խ���");