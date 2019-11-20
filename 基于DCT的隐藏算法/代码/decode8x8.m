function out = decode8x8(block)
    % (4,4)������������ײǽ���(1,6)����������
    rs = [4,3,2,1,1,2,3,4];
    cs = [5,6,7,8,7,6,5,4];
    
    out = zeros(8,1);
    for i = 1:8
       r = rs(i);c = cs(i);
       [sr,sc] = symmetric(r,c);
      if block(r,c) > block(sr,sc) % ���ϴ������£���Ϊ1
          out(i) = 1;
      else                         % ����Ϊ0
          out(i) = 0;
      end
    end
end
%% Ѱ��8x8�����еĶԳƵ�
function [sr,sc] = symmetric(r,c)
    sr = 9-r;
    sc = 9-c;
end