clear;
% Tijdsmeting in functie van groepsgrootte
k = 2/100;
n_start = 1000;
n_step = 10000;
n_max = 192000;
iter = 20;

% externe data bepaald m per groepsgrootte

load("aantal_m_1000_191000.mat");
% init mosek
addpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;

result = zeros(1);
count = 1;

for n=n_start:n_step:n_max
    disp(n);
    m = meting(count,1);
    temp = 0;
    for i=1:iter
        disp(i);
        temp = temp + Test(n,m,k,"mosek");
    end
    result(count) = temp/iter;
    count = count + 1;
end


result = result';
save('mosek_1000_191000.mat');

rmpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;