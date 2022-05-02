% Malioutov plot
load('mosek_noisless.mat');
load('linprog_noisless.mat')
figure;
hold on
plot(1:m_step:m_max,result);

plot(1:m_step_lin:m_max_lin,result_lin);