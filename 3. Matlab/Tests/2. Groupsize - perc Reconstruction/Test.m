% k is the sparsity 
% alg = {'lin','GNU', 'mosek'}
function succes = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == "linprog noisless"
    % init linprog vars
    [f, A, b, Aj, bj, lb, ub, result] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    x = linprog(f, -A, -b, Aj, bj, lb, ub, options);
    succes = isequal(x, result);
elseif alg == "GNU"
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param, result] = TestSetupGNU(n,m,k);
    x = glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    succes = isequal(x, result);
elseif alg == "mosek noisless"
    % init mosek
    [cmd, prob, param, result] = TestSetupMosek(n,m,k);
    [~,res] = mosekopt(cmd,prob,param);
    succes = isequal(res.sol.bas.xx, result);
elseif alg == "linprog noisy"
    % init linprog vars
    [f, A, b, Aj, bj, lb, ub, result] = TestSetupNoisyLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    x = linprog(f, -A, -b, Aj, bj, lb, ub, options);
    succes = isequal(x(1:n), result);
elseif alg == "mosek noisy"
    % init mosek
    [cmd, prob, param, result] = TestSetupNoisyMosek(n,m,k);
    [~,res] = mosekopt(cmd,prob,param);
    succes = isequal(res.sol.bas.xx(1:n), result);
else
    disp("parameter 'alg' is verkeerd, probeer 'linprog noiseless', 'linprog noisy', 'GNU', 'mosek noisless' of 'mosek noisy'");
end
