step = 1000;
max_group = 5000; % De maximale group size
numTest = 100; % Het aantal tests waarover we het gemiddelde nemen
nbGroupSizes = ceil(max_group/step) + 1;
testResult = zeros(nbGroupSizes, numTest);

count = 1;
for n = 0:step:max_group
    m = round((60/150)*n);
    for i = 1:numTest
        testResult(count,i) = group_tester_extra_param(m, 'dual-simplex',n);
    end
    count = count + 1;
    disp('iter');
end

percent_succes_per_m = zeros(nbGroupSizes,1);
for m = 1:nbGroupSizes
    percent_succes_per_m(m) = sum(testResult(m,:))/numTest;
end

figure
x_as = 100:step:max_group;
plot(x_as, percent_succes_per_m)
xlabel("Group size");
ylabel("Successful recreations (%)");
ylim([0 1]);

