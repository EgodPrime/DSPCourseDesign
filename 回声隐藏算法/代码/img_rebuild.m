function [pic2]=img_rebuild(binpic,ori_sample,es2)
%����
binmark2=decode(length(binpic),ori_sample(:,1),es2);
pic2=bin2img(binmark2,shape);
% subplot(1,2,2);
% imshow(pic2);%չʾԭͼ
mae = mean(mean(mean(abs(pic-pic2))));
end