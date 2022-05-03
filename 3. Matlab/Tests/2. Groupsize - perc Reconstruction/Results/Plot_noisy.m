% Malioutov plot

f = figure;
f.Position = [100 100 600 400];
hold on
title('Reconstructie per aantal metingen');
xlabel('Aantal metingen')
ylabel('Reconstructie percentage')

xticks(0:25:150);

load('mosek_noisy.mat');
plot(1:m_step:m_max,result,LineWidth=2);

load('linprog_noisy.mat')
plot(1:m_step:m_max,result,LineWidth=2);

legend("Mosek","Linprog");
set(gca,"FontSize",14);