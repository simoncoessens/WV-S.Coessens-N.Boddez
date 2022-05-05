clear;
% Tijdsmeting in functie van groepsgrootte
k = 2/100;
n_start = 100;
n_step = 1000;
n_max = 10000;
iter = 100;

% externe data bepaald m per groepsgrootte
load("linprog_100_20000.mat");
n_max = 6000;

result = zeros(1);
count = 1;

for n=n_start:n_step:1
    disp(n);
    m = meting(count,2);
    temp = 0;
    for i=1:iter
        temp = temp + Test(n,m,k,"GNU");
    end
    result(count) = temp/iter;
    count = count + 1;
end


result = result';
%save('GNU_100_20000_timing');

result = zeros(1);
count = 1;

for n=n_start:n_step:1
    disp(n);
    m = meting(count,2);
    temp = 0;
    for i=1:iter
        temp = temp + Test(n,m,k,"mosek");
    end
    result(count) = temp/iter;
    count = count + 1;
end


result = result';
%save('mosek_100_20000_timing');

result = zeros(1);
count = 1;

for n=n_start:n_step:n_max
    disp(n);
    m = meting(count,2);
    temp = 0;
    for i=1:iter
        temp = temp + Test(n,m,k,"lin");
    end
    result(count) = temp/iter;
    count = count + 1;
end


result = result';
save('linprog_100_20000_timing');



