clear;
% Tijdsmeting in functie van groepsgrootte
k = 2/100;
n_start = 100;
n_step = 5000;
n_max = 40500;
iter = 20;

% externe data bepaald m per groepsgrootte

%load("100_19100_noiseless_aantal_m_linprog.mat");
% init mosek
%addpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;

result = zeros(1);
count = 1;

for n=n_start:n_step:n_max
    disp(n);
    m = round(n*0.6);
    temp = 0;
    for i=1:iter
        temp = temp + Test(n,m,k,"lin");
    end
    result(count) = temp/iter;
    count = count + 1;
end


result = result';
save('linprog_100_40000');

%rmpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;