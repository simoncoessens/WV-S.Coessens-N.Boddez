% k is the sparsity 
% alg = {'lin','GNU'}
function elapsed_time = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == 'lin'
    % init linprog vars
    [f, Ai, bi, Aj, bj, lb, ub] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    tic;
    linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);
    elapsed_time = toc;
else
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param] = TestSetupGNU(n,m,k);
    tic;
    glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    elapsed_time = toc;
end
