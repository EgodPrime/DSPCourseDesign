%% 测试 myDCT2.m 和 myIDCT2.m
clc;clear;
disp("测试多通道分块二维DCT和IDCT");

% 读取图片
img = imread('hasky.jpg');
img = double(img);
img = img/255;

% 是否使用灰度图
isgray = false;
if isgray
    img = rgb2gray(img);
end

% 变换与逆变换
g = blockDCT2(img);
h = blockIDCT2(g);

% 检查图片相似度
diff = abs(h-img);
ok = mean(mean(mean(diff<3*eps)));
fprintf("【测试多通道分块DCT2变换】DCT2并还原前后平均像素相似度(+-3eps) ? %.2f\n",ok);

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
test_Dmat = dct2(test_mat);
encoded_Dmat = encode8x8(test_Dmat,test_bin);
encoded_mat = idct2(encoded_Dmat);
decoded_bin = decode8x8(dct2(encoded_mat));
disp("测试序列为:");disp(test_bin);
subplot(2,2,1);imshow(test_mat);title("测试块");
subplot(2,2,2);imshow(test_Dmat);title("测试块DCT");
subplot(2,2,3);imshow(encoded_Dmat);title("加密快DCT");
subplot(2,2,4);imshow(test_Dmat==encoded_Dmat);title("加密前后异同");
disp("解密出信息:");disp(decoded_bin');
disp("按任意键继续...");pause;
%% 测试隐藏和解密文本信息
clc;clear;
disp("测试文本信息隐藏");

% 读取图片
img = imread('hasky.jpg');
img = double(img);
img = img/255;

% 定义测试文本
txt = "虹life is strugle but it's fair.";
disp("测试信息为:");disp(txt);

% 隐藏信息
eimg = IMGencodeTXT(img,txt);

% 画图比较
subplot(2,1,1);
imshow(img);title("原始图片");
subplot(2,1,2);
imshow(eimg);title("带信息的图片");

% 测试图片相似度
diff = abs(eimg-img);
ok = mean(mean(mean(diff<5*eps)));
fprintf("【测试TXT信息隐藏】添加隐藏信息前后的平均像素相似度(+-5eps) ? %.2f\n",ok);

% 提取信息
txt = IMGdecodeTXT(eimg);
fprintf("提取出信息：%s\n",txt);

disp("按任意键继续...");pause;
%% 测试图片隐藏图片
clc;clear;
disp("测试图片隐藏图片");

% 读取图片
img = imread('hasky.jpg');
img = double(img);
img1 = img/255;

img = imread('fox.jpg');
img = imresize(img,0.5);
img = double(img);
img2 = img/255;

% 图片隐藏图片
img3 = IMGencodeIMG(img1,img2);
diff = abs(img3-img1);
ok = mean(mean(mean(diff<5*eps)));
fprintf("【测试图片隐藏图片】添加隐藏信息前后的平均像素相似度(+-5eps) ? %.2f\n",ok);
% 提取图片
img4 = IMGdecodeIMG(img3,size(img2));

subplot(2,2,1);imshow(img1);title("宿主图片");
subplot(2,2,2);imshow(img2);title("被隐藏图片");
subplot(2,2,3);imshow(img3);title("带信息图片");
subplot(2,2,4);imshow(img4);title("提取出的图片");
%%
disp("测试结束");