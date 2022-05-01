% k is the sparsity 
% alg = {'lin','GNU', 'mosek'}
function succes = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == 'lin'
    % init linprog vars
    [f, A, b, Aj, bj, lb, ub, result] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    x = linprog(f, -A, -b, Aj, bj, lb, ub, options);
    succes = isequal(x, result);
elseif alg == 'GNU'
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param, result] = TestSetupGNU(n,m,k);
    x = glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    succes = isequal(x, result);
elseif alg == 'mosek'
    % init mosek
    [cmd, prob, param, result] = TestSetupMosek(n,m,k);
    [~,res] = mosekopt(cmd,prob,param);
    succes = isequal(res.sol.bas.xx, result);
else
    disp("parameter 'alg' is verkeerd, probeer 'lin', 'GNU' of 'mosek'");
end
