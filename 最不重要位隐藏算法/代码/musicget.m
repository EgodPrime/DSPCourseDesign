%��ȡ��Ƶ�ļ���ת�ɵ�����
[data,fs]=audioread('C:\Users\lenovo\Desktop\music.mp3');
[~,c] = size(data);
if c == 2
    data = data(:,1) + data(:,2);
    data = data / 2;
end
%����Ƶ�ĵ�60000��65000����תΪ������
n=1;
for i=65000:70000
    replace(n,1:32)=voice(data(i));
    n=n+1;
end

%�Ѻ��λ�滻Ϊͼ�����ص�
for n=1:length(shadepix)
    replace(n,25:32)=shadepix(n,1:8);
end

%�Ѳ���������Ƶƴ��ȥ
for m=1:length(replace)
    data(64999+m)=zvoice(replace(m,1:32));
end

audiowrite('C:\Users\lenovo\Desktop\try.wav',data,fs); 