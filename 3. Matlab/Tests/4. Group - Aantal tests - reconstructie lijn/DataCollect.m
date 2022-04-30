% Collect data for a plot
% x-as: group size
% y-as: aantal tests
% z-as: frontier perfecte reconstructie

step_m = 10;
result = [1 0.5];
count = 1;

for n=0:100:1000
    reconstruction = false;

    % scaling factor van vorig resultaat gebruiken om start m te vinden
    scaling = result(count,2)/result(count,1);

    step_m = n*0.05;
    m = round(n*scaling) - step_m;
    disp('New n:');
    count = count + 1;
    while not(reconstruction)
        m = m + step_m;
        disp(m);
        reconstruction = Test(n,m,2/100,0.9);
    end
    result(count,:) = [n,m];
    disp(result);
end
