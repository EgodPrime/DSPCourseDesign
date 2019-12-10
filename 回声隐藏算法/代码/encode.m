function[es]=encode(msg,ori)
len=length(msg);
ori=reshape(ori(1:len*2000),len,[]);
es = zeros(len,2000);
for i = 1:len
    es(i,:)=add_echo(ori(i,:),800+msg(i)*200,0.4);
end
end

