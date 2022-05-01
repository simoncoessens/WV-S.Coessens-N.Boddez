load("data1.mat");
figure
surf(n_start:n_step:n_max,k_min:k_step:k_max,result)
xlabel('Group size');
ylabel('sparsity');
zlabel('number of tests')