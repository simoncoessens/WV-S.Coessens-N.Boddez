step_size = 500;
numTest = 10; % Het aantal tests waarover we het gemiddelde nemen

result_linprog = zeros(0); 
avg_result_linprog = zeros(0);
n=0;
n_step = 0;
while true
    n = n + step_size;
    n_step = n_step + 1;
    disp(n);
    for i = 1:numTest
        tic;
        % m = 3*k*log(n)
        group_tester_extra_param(round(3*(n/100)*log(n)),'dual-simplex',n);
        result_linprog(n_step,i) = toc;
    end
    avg_result_linprog(n_step) = sum(result_linprog(n_step,:))/numTest;
    if avg_result_linprog(n_step) > 120
        break
    end
end

step_size = 100;
result_glpk = zeros(0); 
avg_result_glpk = zeros(0);
n=0;
n_step = 0;
while true
    n = n + step_size;
    n_step = n_step + 1;
    disp(n);
    for i = 1:numTest
        tic;
        % m = 8.5*k*log(n)
        group_tester_GNU_extra_param(round(8.5*(n/100)*log(n)), n);
        result_glpk(n_step,i) = toc;
    end
    avg_result_glpk(n_step) = sum(result_glpk(n_step,:))/numTest;
    if avg_result_glpk(n_step) > 120
        break
    end
end

figure
x_as_linprog = 1:step_size:length(avg_result_linprog)*step_size;

plot(x_as_linprog, avg_result_linprog)

title('linprog timing')
xlabel("Group size (n)");
ylabel("Time elapsed in s");

figure
x_as_glpk = 1:step_size:length(avg_result_glpk)*step_size;

plot(x_as_glpk, avg_result_glpk)

title('GNU GLPK timing')
xlabel("Group size (n)");
ylabel("Time elapsed in s");