function float=voice(m)
ss=zeros(1,50);
if m>0
    sign=0;
else
    sign=1;
    m=-m;
end

for i=1:50
    m=m*2;
    if(m<1)
        ss(i)=0;
        i=i+1;
    else
        ss(i)=1;
        m=m-1;
        i=i+1;
    end
end

%ʮ���Ƹ�����ת��Ϊ������
for i=1:50
    if(ss(i)==0)
        i=i+1;
        continue
    else
        break
    end
end
k=i;
%ȷ��ָ��λ

exp=zeros(1,8);
w=128-k;
%ָ��λת��Ϊ������

w1=dec2bin(w);
if(length(w1)<8)
    exp(1,8-length(w1))=0;
    for i=1:length(w1)
        exp(8-length(w1)+i)=bin2dec(w1(i));
    end
else
    for i=1:length(w1)
        exp(i)=bin2dec(w1(i));
    end
end
%�ָ��λ8λ

float=[sign,exp,ss(k+1:k+23)];
    