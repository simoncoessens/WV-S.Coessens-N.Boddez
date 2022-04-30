% k is the sparsity 
% alg = {'lin','GNU'}
function elapsed_time = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == 'lin'
    % init linprog vars
    [f, A, b, Aj, bj, lb, ub] = TestSetupLinprog(n,m,k);
    tic;
    linprog(f, -A, -b, Aj, bj, lb, ub, options);
    elapsed_time = toc;
else
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param] = TestSetupGNU(n,m,k);
    tic;
    glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    elapsed_time = toc;
end
