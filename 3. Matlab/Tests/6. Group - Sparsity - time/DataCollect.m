% Tijdsmeting in functie van groepsgrootte
clear;
load("timing_linprog_3d_1_8100.mat")
load("1_8100.mat");


iter = 100;

%result_timing = zeros(1);

count_x = 1;
count_y = 1;
for n=8000:n_step:n_max
    count_y = 1;
    disp(['n:' num2str(n)]);
    for k=0.001:0.001:0.005
        disp(['k:' num2str(k)]);
        m = result(count_y,count_x);
        for i=1:iter
            temp = Test(n,m,k,'lin');
        end
        result_timing(count_y,count_x) = temp/iter;
        count_y = count_y + 1;
    end
    count_x = count_x + 1;
end


result = result';
save('filename');

