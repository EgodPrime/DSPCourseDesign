clc;clear;
img1 = imread('fox.jpg');
img1 = double(img1)/255;
[h,w,c] = size(img1);
h = h-mod(h,8);
w = w-mod(w,8);
%% 提取未知图片
img1 = imresize(img1,[h,w]);

content = inquireIMG(img1);
t = floor(sqrt(content/3/8));
t = t - mod(t,8)-1;
shape = [t,t,3];

img2 = IMGdecodeIMG(img1,shape);
imshow(img2);
%% 提取未知语音
au_r = IMGdecodeAudio(img1,h*w*c/8/8/2);
fs = 16000;
sound(au_r,fs);
