load("timing_linprog_3d_1_8100.mat");

figure
surf(n_start:n_step:n_max,0.005:k_step:k_max,result_timing(5:end,:))
xlabel('Group size');
ylabel('sparsity');
zlabel('Time in s')

xlim([0 8100]);
ylim([0 0.05]);

colorbar;