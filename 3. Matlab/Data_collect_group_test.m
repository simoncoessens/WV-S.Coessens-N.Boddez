max_m = 100; % De maximale waarde voor m
numTest = 1; % Het aantal tests waarover we het gemiddelde nemen
testResult = zeros(max_m, numTest); % Hierin komen de resultaten
for m = 1:max_m
    for i = 1:numTest
        testResult(m,i) = group_tester(m, 'dual-simplex');
    end
end

percent_succes_per_m = zeros(max_m,1);
for m = 1:max_m
    percent_succes_per_m(m) = sum(testResult(m,:))/numTest;
end

figure
x_as = 1:max_m;
plot(x_as, percent_succes_per_m)
xlabel("Number of tests");
ylabel("Successful recreations (%)")
