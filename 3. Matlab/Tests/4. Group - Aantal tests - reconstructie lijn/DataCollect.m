% Collect data for a plot
% x-as: group size
% y-as: aantal tests
% z-as: frontier perfecte reconstructie
p = 0.95;
k = 2/100;
step_m = 10;
result = zeros(1,2);
count = 0;
scaling = 0.3;

for n=100:100:1000
    reconstruction = false;

    step_m = round(n*0.05);
    %start m bepalen (efficienter zo om niet teveel overbodige
    %berekeningen)
    m = round(n*scaling*0.8) - step_m;
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