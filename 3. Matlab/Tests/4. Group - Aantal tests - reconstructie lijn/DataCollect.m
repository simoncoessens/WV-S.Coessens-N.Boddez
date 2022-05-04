% Collect data for a plot
% x-as: group size
% y-as: aantal tests
% z-as: frontier perfecte reconstructie
p = 0.99;
k = 2/100;
n_start = 1000;

n_step = 10000;
n_max = 100000000;


addpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;
step_m = 10;
result = zeros(1,2);
count = 0;
scaling = 0.55;

for n=n_start:n_step:n_max
    reconstruction = false;


    step_m = round(n*0.05);
    %start m bepalen (efficienter zo om niet teveel overbodige
    %berekeningen)
    m = round(n*scaling*0.9) - step_m;

    disp(['New n:' num2str(n)]);
    count = count + 1;
    while not(reconstruction)
        m = m + step_m;
        disp(m);
        reconstruction = Test(n,m,k,p);
    end
    result(count,:) = [n,m];
    %scalin factor voor volgende iter
    scaling = m/n;
    disp(result);
end
rmpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;

save('filename.mat');