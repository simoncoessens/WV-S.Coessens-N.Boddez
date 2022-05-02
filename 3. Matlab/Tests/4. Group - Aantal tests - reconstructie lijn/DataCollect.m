% Collect data for a plot
% x-as: group size
% y-as: aantal tests
% z-as: frontier perfecte reconstructie
p = 0.98;
k = 2/100;
n_start = 100;

n_step = 500;
n_max = 10000;



step_m = 10;
result = zeros(1,2);
count = 0;
scaling = 0.3;

for n=n_start:n_step:n_max
    reconstruction = false;


    step_m = round(n*0.01);
    %start m bepalen (efficienter zo om niet teveel overbodige
    %berekeningen)
    m = round(n*scaling) - step_m;

    disp('New n:');
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


save('filename.mat');