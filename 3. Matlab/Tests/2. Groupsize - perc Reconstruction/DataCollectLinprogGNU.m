clear;
% Test reconstructie graad voor een m aantal testen
n = 150;
k = 4/150;
m_max = 150;
m_step = 1;


result = zeros(1,100);
count = 1;
for m=1:m_step:0
    disp(m);
    temp = 0;
    for i=1:50
        temp = temp + Test(n,m,k,"linprog noisless");
    end
    result(count) = temp/50;
    count = count + 1;
end

%save('linprog_noisless_vs_GNU.mat');

result = zeros(1,100);
count = 1;
for m=1:m_step:m_max
    disp(m);
    temp = 0;
    for i=1:50
        temp = temp + Test(n,m,k,"GNU");
    end
    result(count) = temp/50;
    count = count + 1;
end

save('GNU_noisless.mat');


