function[es]=encode(msg,ori)
len=length(msg);
ori=reshape(ori(2000001:2000000+len*200),len,[]);
es = zeros(len,200);
for i = 1:len
    es(i,:)=add_echo(ori(i,:),30+msg(i)*20,0.1);
end
end

