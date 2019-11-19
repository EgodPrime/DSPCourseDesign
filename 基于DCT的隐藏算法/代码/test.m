%% 测试 myDCT2.m 和 myIDCT2.m
clc;clear;
disp("测试多通道二维DCT和IDCT");

% 读取图片
img = imread('hasky.jpg');

% 是否使用灰度图
isgray = false;
if isgray
    img = rgb2gray(img);
end

% 变换与逆变换
g = myDCT2(img);
h = myIDCT2(g);

% 检查图片相似度
ok = mean(mean(mean(h==img)));
fprintf("经过DCT变换和复原前后的平均像素相似度 ? %f\n",ok);

% 画图比较
subplot(2,1,1);
imshow(img);title("原始图片");
subplot(2,1,2);
imshow(h);title("IDCT复原图片");

disp("按任意键继续...");pause;
%% 测试8x8加密与解密
disp("测试8x8加密与解密")
test_bin = [1 0 0 1 1 1 0 0];
test_mat = randn(8,8);
encoded_mat = encode8x8(test_mat,test_bin);
decoded_bin = decode8x8(encoded_mat);
disp("测试序列为:");disp(test_bin);
subplot(1,2,1);imshow(test_mat);title("测试块");
subplot(1,2,2);imshow(encoded_mat);title("加密块");
disp("解密出信息:");disp(decoded_bin');
disp("按任意键继续...");pause;
%% 测试隐藏和解密文本信息
clc;clear;
disp("测试文本信息隐藏");

% 读取图片
img = imread('hasky.jpg');

% 定义测试文本
txt = "eve is a super sb hahahaha !";

% 隐藏信息
eimg = IMGencodeTXT(img,txt);

% 画图比较
subplot(2,1,1);
imshow(img);title("原始图片");
subplot(2,1,2);
imshow(eimg);title("带信息的图片");

% 测试图片相似度
ok = mean(mean(mean(eimg==img)));
fprintf("添加隐藏信息前后的平均像素相似度 ? %f\n",ok);

% 提取信息
txt = IMGdecodeTXT(eimg);
fprintf("提取出信息：%s\n",txt);

disp("按任意键继续...");pause;
%%
disp("测试结束");