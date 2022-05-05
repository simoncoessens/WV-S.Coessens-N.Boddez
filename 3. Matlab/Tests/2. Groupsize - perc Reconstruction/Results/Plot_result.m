% Malioutov plot
f = figure;
f.Position = [100 100 600 400];
hold on
title('Reconstructie per aantal metingen');
xlabel('Aantal metingen')
ylabel('Reconstructie percentage')

xticks(0:25:150);

load("GNU_noisless.mat");
plot(1:m_step:m_max,result,LineWidth=1.5);

load("linprog_noisless_vs_GNU.mat");
plot(1:m_step:m_max,result,LineWidth=1.5);

load("mosek_noisless_GNU.mat");
plot(1:m_step:m_max,result,LineWidth=1.5);

legend("GNU","Linprog","Mosek");

set(gca,"FontSize",14);