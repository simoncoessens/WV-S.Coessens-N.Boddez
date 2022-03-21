min_m = 400; % De startwaarde voor m
max_m = 1000; % De maximale waarde voor m
delta_m = max_m - min_m;
numTest = 5; % Het aantal tests waarover we het gemiddelde nemen
testResult = zeros(delta_m, numTest); % Hierin komen de resultaten
for m = min_m+1:max_m
    for i = 1:numTest
        testResult((m-min_m),i) = group_tester(1000, 50, m);
    end
end

percent_succes_per_m = zeros(delta_m,1);
for m = 1:delta_m
    percent_succes_per_m(m) = sum(testResult(m,:))/numTest;
end

figure
x_as = min_m+1:max_m;
plot(x_as, percent_succes_per_m)
xlabel("Number of tests");
ylabel("Successful recreations (%)")
