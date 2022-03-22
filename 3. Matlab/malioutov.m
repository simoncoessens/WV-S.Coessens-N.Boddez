max_m = 100; % De maximale waarde voor m
step_size = 5;
numTest = 200; % Het aantal tests waarover we het gemiddelde nemen
result_linprog = zeros(max_m/step_size, numTest); 
result_GNU = zeros(max_m/step_size, numTest);

for m = 1:max_m/step_size
    disp(m);
    for i = 1:numTest
        result_linprog(m,i) = group_tester(200, 2, m*step_size);
        result_GNU(m,i) = group_tester_GNU(m*step_size);
    end
end

avg_result_linprog = zeros(max_m/step_size,1);
avg_result_GNU = zeros(max_m/step_size,1);
for m = 1:max_m/step_size
    avg_result_linprog(m) = sum(result_linprog(m,:))/numTest;
    avg_result_GNU(m) = sum(result_GNU(m,:))/numTest;
end

figure
x_as = 1:step_size:max_m;

plot(x_as, avg_result_linprog);
hold on;
plot(x_as, avg_result_GNU);

xlabel("Number of tests");
ylabel("Succesfull recreations %");
legend('linprog','GLPK');