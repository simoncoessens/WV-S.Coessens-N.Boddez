% Plot de tijdsmeting

f = figure;
f.Position = [100 100 600 400];
hold on;
%title('Tijdsmeting noisy vs noiseless');
xlabel('Groepsgrootte');
ylabel('Tijd in s');


load("linprog_100_20000_noiseless.mat");
plot(100:1000:9100,result(1:10),LineWidth=1.5, color='#02b002');

load("linprog_100_9600_noisy.mat");
plot(100:500:9100,result(1:19),LineWidth=1.5, color='#fc7d1c');

legend("zonder ruis", "met ruis");
legend('Location','northwest')
set(gca,"FontSize",14);
xlim([0 9100])
