function[acc]=accuracy(binpic,binmark2)
sum=0;
for i=1:5292
    if binpic(i)==binmark2(i)
        sum=sum+1;
    end
end
acc=sum/30000;