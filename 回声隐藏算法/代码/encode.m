function[es3]=encode(msg,ori)
len=length(msg);
ori_new=reshape(ori(1:len*2000),len,[]);
es = zeros(len,2000);
for i = 1:len
    es(i,:)=add_echo(ori_new(i,:),800+msg(i)*200,0.4);
end
 es = es(:);
 es2 = ori(len*2000+1:length(ori));
 es3 = cat(1,es,es2);
end

