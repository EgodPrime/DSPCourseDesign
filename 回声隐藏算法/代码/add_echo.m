function[y]=add_echo(x,m,alpha)
N=length(x);
h = zeros(m+1,1);
h(1)=1;
h(m+1)=alpha;
y=conv(x,h);
y=y(1:N);
end
