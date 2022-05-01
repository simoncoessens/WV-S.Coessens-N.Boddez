% in linprog the bounds gaan checken van n
% k is the sparsity 
% alg = {'lin','GNU'}
% p: percentage van testen met perfecte reconstructie
function reconstruction = Test(n,m,k)

% Initialize al the necessary variables

% init linprog vars
total_succes = 0;
for i=1:100
    [f, Ai, bi, Aj, bj, lb, ub, result] = TestSetupLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    x = linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);
    total_succes = total_succes + isequal(x, result);
end


reconstruction = total_succes/100;
