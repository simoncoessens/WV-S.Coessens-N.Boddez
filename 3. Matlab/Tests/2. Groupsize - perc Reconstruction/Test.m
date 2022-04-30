% k is the sparsity 
% alg = {'lin','GNU'}
function succes = Test(n,m,k,alg)

% Initialize al the necessary variables

if alg == 'lin'
    % init linprog vars
    [f, A, b, Aj, bj, lb, ub, result] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    x = linprog(f, -A, -b, Aj, bj, lb, ub, options);
    succes = isequal(x, result);
else
    % init GNU
    [c, A, b, lb, ub, ctype, vartype, sense, param, result] = TestSetupGNU(n,m,k);
    x = glpk(c,A,b,lb,ub,ctype,vartype,sense,param);
    succes = isequal(x, result);
end
