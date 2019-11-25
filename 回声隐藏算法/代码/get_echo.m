function [bit]=get_echo(echo,raw,m1,m2)
y1=fft(echo);
y2=log(y1);
y3=ifft(y2);
x1 = fft(raw);
x2 = log(x1);
x3 = ifft(x2);
ch = abs(abs(y3)-abs(x3));
ch0 = ch(m1-3:m1+3);
ch1 = ch(m2-3:m2+3);
c = max(max(ch0),max(ch1));
loc=find(ch==c);
if abs(loc-m1)<abs(loc-m2)
    bit=0;
else
    bit=1;
end
end