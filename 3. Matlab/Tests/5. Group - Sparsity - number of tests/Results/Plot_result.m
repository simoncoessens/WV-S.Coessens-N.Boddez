load("1_8100.mat");
figure
surf(n_start:n_step:8101,k_min:k_step:k_max,result)
xlabel('Group size');
ylabel('sparsity');
zlabel('number of tests')