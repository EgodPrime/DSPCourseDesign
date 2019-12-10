function [bit]=get_echo(echo,raw,m1,m2)
y1=fft(echo);
y2=log(y1);
y3=ifft(y2);
x1 = fft(raw);
x2 = log(x1);
x3 = ifft(x2);


% d = max(x3(m1-3:m1+3),x3(m2-3:m2+3));
% loc1=find(max(x3(m1-3:m1+3)));%原始语音倒谱值比较
% loc2=find(max(x3(m2-3:m2+3)));
p0 = x3(m1+1); p1 = x3(m2+1);
d0 = y3(m1+1); d1 = y3(m2+1);
if d0-p0 > d1-p1
    bit = 0;
else
    bit = 1;
end

% bit = 0;
% if p0>p1 
%     if abs(d1-p1)>abs(d0-p0) || abs(d1) > abs(d0)
%         bit = 1;
%     end
% else
%     if abs(d0-p0)>abs(d1-p1) || abs(d0) > abs(d1)
%         bit = 0;
%     end
% end


% ch = abs(abs(y3)-abs(x3));
% ch0 = ch(m1-3:m1+3);
% ch1 = ch(m2-3:m2+3);
% 
% c = max(max(ch0),max(ch1));
% loc=find(ch==c);
% if abs(loc-m1)<abs(loc-m2) 
%     bit=0;
% else
%     bit=1;
% end
end