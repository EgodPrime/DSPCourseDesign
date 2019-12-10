function[binmark]=decode(len,ori,es)
ori=reshape(ori(1:len*2000),len,[]);
binmark=zeros(len,1);
for i=1:len
    binmark(i)=get_echo(es(i,:),ori(i,:),800,1000);
end
end

% mp3 = mean(watermark,2);
% ts = mp3(10001:11600);
% ts = reshape(ts,8,[]);
% 
% a = 'e';
% b = unicode2native(a);
% c = uint82bin(double(b));
% 
% es = zeros(8,200);
% for i = 1:8
% es(i,:)=add_echo(ts(i,:),30+c(i)*20,0.6);
% end
% 
% echo = zeros(8,1);
% for i = 1:8
% echo(i) = decode(es(i,:),ts(i,:),30,50);
% end
% d = bin2uint8(echo);
