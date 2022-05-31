load("timing_100_19100.mat");

figure
surf(n_start:n_step:n_max,0.005:k_step:k_max,result_timing(5:end,:))
%title('Heatmap uitvoeringstijd');
xlabel('Groepsgrootte');
ylabel('Spaarsheid');
zlabel('Time in s')

xlim([0 19100]);
%ylim([0 0.05]);

colorbar;
set(gca,"FontSize",14);