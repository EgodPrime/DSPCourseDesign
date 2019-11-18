function out = encode8x8(block,info)
    % (4,5)������������ײǽ���(1,7)����������
    rs = [4,3,2,1,1,2,3,4];
    cs = [5,6,7,8,7,6,5,4];
    for i = 1:8
       r = rs(i);c = cs(i);
       [sr,sc] = symmetric(r,c);
       if info(i) > 0 % ��i������Ϊ1�������ϱ����������
          if block(r,c) < block(sr,sc) % ���򣬽���λ��
              temp = block(r,c);
              block(r,c) = block(sr,sc);
              block(sr,sc) = temp;
          end
       else           % ��i������Ϊ0�������ϱ���С������
           if block(r,c) > block(sr,sc) % ���򣬽���λ��
              temp = block(r,c);
              block(r,c) = block(sr,sc);
              block(sr,sc) = temp;
          end
       end
    end
    out = block;
end
%% Ѱ��8x8�����еĶԳƵ�
function [sr,sc] = symmetric(r,c)
    sr = 9-r;
    sc = 9-c;
end