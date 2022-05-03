% Plot de tijdsmeting
load("linprog_100_9600_noisy.mat");

f = figure;
f.Position = [100 100 600 400];
hold on;
title('Tijdsmeting Linprog noisy');
xlabel('Groep grootte');
ylabel('Tijd in s');


load("linprog_100_9600_noisy.mat");
plot(n_start:1000:10000,result([2:2:20]),LineWidth=2);

load("linprog_100_20000.mat");
plot(n_start:1000:10000,result(1:10),LineWidth=2);

legend("Noisy","Noiseless");
set(gca,"FontSize",14);
