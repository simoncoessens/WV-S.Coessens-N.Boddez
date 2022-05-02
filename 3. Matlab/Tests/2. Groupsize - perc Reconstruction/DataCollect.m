clear;
% Test reconstructie graad voor een m aantal testen
n = 150;
k = 4/150;
m_max = 150;
m_step = 1;


result = zeros(1,100);
count = 1;
for m=1:m_step:m_max
    disp(m);
    temp = 0;
    for i=1:500
        temp = temp + Test(n,m,k,"linprog noisless");
    end
    result(count) = temp/500;
    count = count + 1;
end

save('linprog_noisless.mat');


addpath('C:\program files\mosek\9.3\toolbox\r2015a')
result = zeros(1,100);
count = 1;
for m=1:m_step:m_max
    disp(m);
    temp = 0;
    for i=1:500
        temp = temp + Test(n,m,k,"mosek noisless");
    end
    result(count) = temp/500;
    count = count + 1;
end

save('mosek_noisless.mat');
rmpath('C:\program files\mosek\9.3\toolbox\r2015a')


result = zeros(1,100);
count = 1;
for m=1:m_step:m_max
    disp(m);
    temp = 0;
    for i=1:500
        temp = temp + Test(n,m,k,"linprog noisy");
    end
    result(count) = temp/500;
    count = count + 1;
end

save('linprog_noisy.mat');


addpath('C:\program files\mosek\9.3\toolbox\r2015a')
result = zeros(1,100);
count = 1;
for m=1:m_step:m_max
    disp(m);
    temp = 0;
    for i=1:500
        temp = temp + Test(n,m,k,"mosek noisy");
    end
    result(count) = temp/500;
    count = count + 1;
end

save('mosek_noisy.mat');
rmpath('C:\program files\mosek\9.3\toolbox\r2015a')

