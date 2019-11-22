zsign=float(1)%符号位
exp1=0;
for i=2:9
    exp1=exp1+float(i)*2^(9-i);
end
zexp=exp1-128             %指数位


zss=0.0000000000000;
for i=10:32
zss=zss+float(i)*2^(zexp-i+9);
end
zss=zss+2^(zexp)