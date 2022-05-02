% Plot de tijdsmeting
load("mosek_1_5000.mat");
load("linprog_1_5000.mat");

figure
hold on;
plot(n_start:n_step:n_max,result);
plot(n_start_m:n_step_m:n_max_m,result_mosek);