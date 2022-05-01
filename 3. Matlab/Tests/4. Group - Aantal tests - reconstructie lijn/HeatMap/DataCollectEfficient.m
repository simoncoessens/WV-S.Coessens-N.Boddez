% Collect data for a plot
% x-as: group size
% y-as: aantal tests
% z-as: frontier perfecte reconstructie
p = 0.95;
k = 2/100;
n_start = 1;
n_step = 100;
n_max = 5000;

step_m = 10;
result = zeros(1,1);
count_x = 1;
prev_m = 1;
prev_y = 1;

for n =n_start:n_step:n_max
    reconstruction = false;
    disp('New n:');
    disp(n);
    

    m = prev_m;
    count_y = prev_y;
    prev_zero = true;        
    while not(reconstruction)
        disp(m);
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

save('filename.mat');