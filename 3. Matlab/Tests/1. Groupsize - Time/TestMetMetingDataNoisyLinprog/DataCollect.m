clear;
% Tijdsmeting in functie van groepsgrootte
k = 2/100;
n_start = 100;
n_step = 500;
n_max = 10000;
iter = 100;

% externe data bepaald m per groepsgrootte
load("100_9600_linprog_noisy.mat");
addpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;
result = zeros(1);
count = 1;

for n=n_start:n_step:n_max
    disp(n);
    m = meting(count,2);
    temp = 0;
    for i=1:iter
        temp = temp + Test(n,m,k,'mosek');
    end
    result(count) = temp/iter;
    count = count + 1;
end

result = result';
save('mosek_100_9600_noisy');

