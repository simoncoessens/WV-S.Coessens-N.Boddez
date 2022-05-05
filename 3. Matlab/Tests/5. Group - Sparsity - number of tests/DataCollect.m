% Collect data for a plot
% x-as: group size
% y-as: sparsity
% z-as: m aantal testen om perfecte reconstructie
p = 0.99;
k_min = 0.001;
k_step = 0.001;
k_max = 0.04;

n_start = 100;
n_step = 1000;
n_max = 20000;

m_step = 5;


result = zeros(1,2);
count = 0;
scaling = 0.01;

count_k = 1;
count_n = 1;

for n=n_start:n_step:n_max
    disp(['n:' num2str(n)]);
    scaling = 0.01;
    count_k = 1;
    %m_step meeschalen met n
    m_step = round(n*0.02);
    for k=k_min:k_step:k_max
        disp(['k:' num2str(k)]);
        reconstruction = false;

        m = round(n * scaling) - m_step;
        while not(reconstruction)
            m = m + m_step;
            disp(['m:' num2str(m)]);
            reconstruction = Test(n,m,k,p);
        end
        %scaling factor voor volgende iter
        scaling = m/n;
        result(count_k,count_n) = m;
        count_k = count_k + 1;
    end
    count_n = count_n + 1;
end


save('filename.mat');