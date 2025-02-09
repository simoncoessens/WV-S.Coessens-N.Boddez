% Plot de tijdsmeting

f = figure;
f.Position = [100 100 600 400];
hold on;
%title('Tijdsmeting Linprog Mosek noisy');
xlabel('Groepsgrootte');
ylabel('Tijd in s');


load("mosek_100_9600_noisy.mat");
plot(n_start:1000:20000,result,LineWidth=1.5);

load("linprog_100_9600_noisy.mat");
plot(n_start:1000:20000,result,LineWidth=1.5);

legend("Mosek", "Linprog");
legend('Location','northwest')
set(gca,"FontSize",14);
