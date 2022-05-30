% Plot de tijdsmeting

f = figure;
f.Position = [100 100 600 400];
hold on
title('Tijdsmeting Linprog, Mosek, Glpk');
xlabel('Groepsgrootte');
ylabel('Tijd in s');


load("mosek_100_20000_timing.mat");
plot(n_start:n_step:n_max,result,LineWidth=1.5);

load("linprog_100_20000_timing.mat");
plot(n_start:n_step:n_max,result,LineWidth=1.5);

load("GNU_100_20000_timing.mat");
plot(n_start:n_step:n_max,result,LineWidth=1.5);

xlim([0 5000]);
legend("Mosek","Linprog","Glpk");
legend('Location','northwest')
set(gca,"FontSize",14);