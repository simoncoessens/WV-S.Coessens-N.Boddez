% k is the sparsity 
% alg = {'lin','GNU', 'mosek'}
function elapsed_time = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == 'lin'
    % init linprog vars
    [f, Ai, bi, Aj, bj, lb, ub] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    tic;
    linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);
    elapsed_time = toc;
elseif alg == 'GNU'
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param] = TestSetupGNU(n,m,k);
    tic;
    glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    elapsed_time = toc;
elseif alg == 'mosek'
    % init mosek
    [cmd, prob, param] = TestSetupMosek(n,m,k);
    tic;
    mosekopt(cmd, prob, param);
    elapsed_time = toc;
else
    disp("parameter 'alg' is verkeerd, probeer 'lin', 'GNU' of 'mosek'");
end
