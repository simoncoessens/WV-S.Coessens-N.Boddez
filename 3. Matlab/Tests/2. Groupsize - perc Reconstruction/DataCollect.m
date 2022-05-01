% Test reconstructie graad voor een m aantal testen
n = 150;
k = 4/150;
m_max = 100;
m_step = 10;


result = zeros(1,10);
count = 1;
for m=1:m_step:m_max
    disp(m);
    temp = 0;
    for i=1:100
        temp = temp + Test(n,m,k,'lin');
    end
    result(count) = temp/100;
    count = count + 1;
end


save('filename.mat');


