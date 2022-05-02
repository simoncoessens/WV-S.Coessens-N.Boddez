clear;
% Tijdsmeting in functie van groepsgrootte
k = 2/100;
n_start = 100;
n_step = 100;
n_max = 20000;
iter = 100;

% externe data bepaald m per groepsgrootte

load("100_19100_noiseless_aantal_m_linprog.mat");
% init mosek
addpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;

result = zeros(1);
count = 1;

for n=n_start:n_step:n_max
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
save('mosek_100_20000');

rmpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;