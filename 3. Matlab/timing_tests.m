max_m = 1000; % De maximale waarde voor m
step_size = 10;
numTest = 20; % Het aantal tests waarover we het gemiddelde nemen
dual_simplex_result = zeros(max_m/step_size, numTest); 
interior_point_legacy_result = zeros(max_m/step_size, numTest); 
interior_point_result = zeros(max_m/step_size, numTest); 

for m = 1:max_m/step_size
    for i = 1:numTest
        tic;
        group_tester(m*step_size, 'dual-simplex');
        time_elapsed = toc;
        dual_simplex_result(m,i) = time_elapsed;

        tic;
        group_tester(m*step_size, 'interior-point-legacy');
        time_elapsed = toc;
        interior_point_legacy_result(m,i) = time_elapsed;

        tic;
        group_tester(m*step_size, 'interior-point');
        time_elapsed = toc;
        interior_point_result(m,i) = time_elapsed;
    end
end

avg_time_dual_simplex = zeros(max_m/step_size,1);
avg_time_interior_point_legacy = zeros(max_m/step_size,1);
avg_time_interior_point = zeros(max_m/step_size,1);
for m = 1:max_m/step_size
    avg_time_dual_simplex(m) = sum(dual_simplex_result(m,:))/numTest;
    avg_time_interior_point_legacy(m) = sum(interior_point_legacy_result(m,:))/numTest;
    avg_time_interior_point(m) = sum(interior_point_result(m,:))/numTest;
end

figure
x_as = 1:step_size:max_m;

plot(x_as, avg_time_dual_simplex)
hold on
plot(x_as, avg_time_interior_point_legacy)
hold on
plot(x_as, avg_time_interior_point)

xlabel("Number of tests");
ylabel("Time elapsed");
legend('dual-simplex', 'interior-point-legacy', 'interior-point')