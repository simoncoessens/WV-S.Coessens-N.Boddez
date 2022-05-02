% k is the sparsity 
% alg = {'lin','GNU', 'mosek'}
function elapsed_time = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == "linprog noiseless"
    % init linprog vars
    [f, Ai, bi, Aj, bj, lb, ub, result] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    tic;
    linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);
    elapsed_time = toc;
elseif alg == "GNU"
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param] = TestSetupGNU(n,m,k);
    tic;
    glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    elapsed_time = toc;
elseif alg == "mosek noiseless"
    % init mosek
    [cmd, prob, param] = TestSetupMosek(n,m,k);
    tic;
    mosekopt(cmd, prob, param);
    elapsed_time = toc;
elseif alg == "linprog noisy"
    % init linprog vars
    [f, Ai, bi, Aj, bj, lb, ub] = TestSetupNoisyLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    tic;
    linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);
    elapsed_time = toc;
elseif alg == "mosek noisy"
    % init mosek
    [cmd, prob, param] = TestSetupNoisyMosek(n,m,k);
    tic;
    mosekopt(cmd, prob, param);
    elapsed_time = toc;
else
    disp("parameter 'alg' is verkeerd, probeer 'linprog noiseless', 'linprog noisy, 'GNU', 'mosek noiseless' of 'mosek noisy'");
end
