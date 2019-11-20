function out = decode8x8(block)
    % (4,4)向右上搜索，撞墙后从(1,6)向坐下搜索
    rs = [4,3,2,1,1,2,3,4];
    cs = [5,6,7,8,7,6,5,4];
    
    out = zeros(8,1);
    for i = 1:8
       r = rs(i);c = cs(i);
       [sr,sc] = symmetric(r,c);
      if block(r,c) > block(sr,sc) % 右上大于左下，则为1
          out(i) = 1;
      else                         % 否则为0
          out(i) = 0;
      end
    end
end
%% 寻找8x8矩阵中的对称点
function [sr,sc] = symmetric(r,c)
    sr = 9-r;
    sc = 9-c;
end