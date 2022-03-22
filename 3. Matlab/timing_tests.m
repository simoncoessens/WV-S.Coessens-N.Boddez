max_n = 200; % De maximale waarde voor m
step_size = 10;
numTest = 20; % Het aantal tests waarover we het gemiddelde nemen
result = zeros(max_n/step_size, numTest); 

for n = 1:max_n/step_size
    for i = 1:numTest
        tic;
        group_tester_GNU(n*step_size);
        result(n,i) = toc;
    end
end

avg_result = zeros(max_m/step_size,1);
for m = 1:max_n/step_size
    avg_result(m) = sum(result(m,:))/numTest;
end

figure
x_as = 1:step_size:max_m;

plot(x_as, avg_result)

xlabel("Group size (n)");
ylabel("Time elapsed in s");