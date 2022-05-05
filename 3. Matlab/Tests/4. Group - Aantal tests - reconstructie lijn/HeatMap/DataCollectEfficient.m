% Collect data for a plot
% x-as: group size
% y-as: aantal tests
% z-as: frontier perfecte reconstructie
p = 0.99;
k = 2/100;
n_start = 100;
n_step = 100;
n_max = 10000;

step_m = 20;
result = zeros(1,1);
count_x = 1;
prev_m = 1;
prev_y = 1;
addpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;

for n =n_start:n_step:n_max
    reconstruction = false;
    disp(['n:' num2str(n)]);
    

    m = prev_m;
    count_y = prev_y;
    prev_zero = true;        
    while not(reconstruction)
        disp(['m:' num2str(m)]);
        perc_reconstruction = Test(n,m,k);
        result(count_y,count_x) = perc_reconstruction;
        reconstruction = perc_reconstruction > p;
        if (prev_zero && (perc_reconstruction > 0))
        	prev_zero = false;
        	prev_y = count_y;
        	prev_m = m;
        end
        m = m + step_m;
        count_y = count_y + 1;
    end
    disp(result);
    count_x = count_x + 1;
    

end

% naar normale richting brengen, (matlab telt naar beneden)
result = flipud(result);
[max_row, max_collumn] = size(result);

% 1tjes vullen
for i=1:max_collumn
    for j=1:max_row
        if result(j,i) > p
            break;
        else
            % perfecte reconstructie boven onze graad van p
            result(j,i) = 1;
        end
    end
end

rmpath /home/simoncoessens/mosek/9.3/toolbox/r2015a;
save('filename.mat');