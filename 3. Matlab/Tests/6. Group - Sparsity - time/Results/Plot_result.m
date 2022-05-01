load("data1_timings.mat");

figure
surf(n_start:n_step:n_max,k_min:k_step:k_max,result_timing)
xlabel('Group size');
ylabel('sparsity');
zlabel('Time in s')