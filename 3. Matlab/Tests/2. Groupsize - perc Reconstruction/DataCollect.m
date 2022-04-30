result = zeros(1,10);
count = 1;
for m=1:10:100
    temp = 0;
    for i=1:100
        temp = temp + Test(150,m,4/150,'lin');
    end
    result(count) = temp/100;
    count = count + 1;
end
disp(result)
