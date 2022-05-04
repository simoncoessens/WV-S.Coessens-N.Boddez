% Plot de tijdsmeting
load("mosek_1000_191000.mat");

% Plot de tijdsmeting

f = figure;
f.Position = [100 100 600 400];
hold on
title('Tijdsmeting Mosek');
xlabel('Groepsgrootte');
ylabel('Tijd in s');



plot(n_start:n_step:192000,result,LineWidth=2);

%load("linprog_100_20000.mat");
%plot(n_start:n_step:n_max,result,LineWidth=2);


%legend("Mosek","Linprog");
set(gca,"FontSize",14);