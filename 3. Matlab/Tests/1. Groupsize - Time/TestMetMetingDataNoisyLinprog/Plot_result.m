% Plot de tijdsmeting
load("linprog_100_20000.mat");

figure
hold on;
plot(n_start:n_step:n_max,result);
