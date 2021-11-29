mf = 6;

err = zeros(4,1);
count = 1;
for n = 1000:2000:10000
    err(count) = group_tester(n,0.01,mf) ;
    count = count + 1;
end

plot(err)