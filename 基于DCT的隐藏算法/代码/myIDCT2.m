%% 支持三通道的二维IDCT
function [img] = myIDCT2(X)
    [h,w,c] = size(X);
    if c == 3
        img = zeros(h,w,c);
        for i = 1:c
           img(:,:,i) = idct2(X(:,:,i));
        end
    else
        img = idct2(X);
    end
    img = uint8(img);
end
% function [img] = myIDCT(X)
% [h,w,c] = size(X);
% big = max([h,w]);
% A = zeros(big,big);
% 
% for i = 0:big-1
%     if(i==0)
%         a = sqrt(1/big);
%     else
%         a = sqrt(2/big);
%     end
%     for j = 0:big-1
%         A(i+1,j+1)=a*cos(pi*(j+0.5)*i/big);
%     end
% end
% 
% if(c == 3)
%    img = zeros(big,big,3);
%    img(1:h,1:w,:) = X;
%    img(:,:,1) = A'*img(:,:,1)*A;
%    img(:,:,2) = A'*img(:,:,2)*A;
%    img(:,:,3) = A'*img(:,:,3)*A;
%    img = img(1:h,1:w,:);
%    img = uint8(img);
% else
%    img = zeros(big,big);
%    img(1:h,1:w) = X;
%    img = A'*img*A;
%    img = img(1:h,1:w);
%    img = uint8(img);
% end
% end