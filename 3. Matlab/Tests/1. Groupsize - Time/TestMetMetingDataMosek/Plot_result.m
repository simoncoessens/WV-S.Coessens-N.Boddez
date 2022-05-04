% Plot de tijdsmeting
load("mosek_100_40000.mat");

figure
hold on;
plot(n_start:n_step:n_max,result);

%load("linprog_100_20000.mat");
%plot(n_start:n_step:n_max,result);