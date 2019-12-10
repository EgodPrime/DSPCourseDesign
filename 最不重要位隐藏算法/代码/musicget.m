%读取音频文件，转成单声道
[data,fs]=audioread('C:\Users\lenovo\Desktop\music.mp3');
[~,c] = size(data);
if c == 2
    data = data(:,1) + data(:,2);
    data = data / 2;
end
%把音频的第60000—65000个点转为二进制
n=1;
for i=65000:70000
    replace(n,1:32)=voice(data(i));
    n=n+1;
end

%把后八位替换为图像像素点
for n=1:length(shadepix)
    replace(n,25:32)=shadepix(n,1:8);
end

%把操作过的音频拼回去
for m=1:length(replace)
    data(64999+m)=zvoice(replace(m,1:32));
end

audiowrite('C:\Users\lenovo\Desktop\try.wav',data,fs); 