function out = encode8x8(block,info)
    % (4,5)向右上搜索，撞墙后从(1,7)向坐下搜索
    rs = [4,3,2,1,1,2,3,4];
    cs = [5,6,7,8,7,6,5,4];
    for i = 1:8
       r = rs(i);c = cs(i);
       [sr,sc] = symmetric(r,c);
       if info(i) > 0 % 第i个比特为1，则右上必须大于左下
          if block(r,c) < block(sr,sc) % 否则，交换位置
              temp = block(r,c);
              block(r,c) = block(sr,sc);
              block(sr,sc) = temp;
          end
       else           % 第i个比特为0，则右上必须小于左下
           if block(r,c) > block(sr,sc) % 否则，交换位置
              temp = block(r,c);
              block(r,c) = block(sr,sc);
              block(sr,sc) = temp;
          end
       end
    end
    out = block;
end
%% 寻找8x8矩阵中的对称点
function [sr,sc] = symmetric(r,c)
    sr = 9-r;
    sc = 9-c;
end