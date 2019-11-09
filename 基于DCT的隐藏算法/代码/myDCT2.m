%% 支持三通道的二维DCT
function [X] = myDCT2(img)
    [h,w,c] = size(img);
    if c == 3
        X = zeros(h,w,c);
        for i = 1:c
           X(:,:,i) = dct2(img(:,:,i));
        end
    else
        X = dct2(img);
    end
end
% function [X] = myDCT2(img)
%     [h,w,c] = size(img);
%     big = max([h,w]);
%     A = zeros(big,big);
%     img = double(img);
%     
%     for i = 0:big-1
%         if(i==0)
%             a = sqrt(1/big);
%         else
%             a = sqrt(2/big);
%         end
%         for j = 0:big-1
%             A(i+1,j+1)=a*cos(pi*(j+0.5)*i/big);
%         end
%     end
%     
%     if(c == 3)
%        X = zeros(big,big,3);
%        X(1:h,1:w,:) = img;
%        X(:,:,1) = A*X(:,:,1)*A';
%        X(:,:,2) = A*X(:,:,2)*A';
%        X(:,:,3) = A*X(:,:,3)*A';
%        X = X(1:h,1:w,:);
%     else
%        X = zeros(big,big);
%        X(1:h,1:w) = img;
%        X = A*X*A';
%        X = X(1:h,1:w);
%     end
% end