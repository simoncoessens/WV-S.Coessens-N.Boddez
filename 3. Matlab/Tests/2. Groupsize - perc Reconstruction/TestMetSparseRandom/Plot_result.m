% Malioutov plot
load('mosek_noisless.mat');
load('linprog_noisless.mat')
f = figure;
f.Position = [100 100 600 400];
hold on
title('Reconstructie per aantal metingen');
xlabel('Aantal metingen')
ylabel('Reconstructie percentage')

xticks(0:25:150);

plot(1:m_step:m_max,result,LineWidth=2);

plot(1:m_step:m_max,result_lin,LineWidth=2);

legend("Mosek","Linprog");

set(gca,"FontSize",14);