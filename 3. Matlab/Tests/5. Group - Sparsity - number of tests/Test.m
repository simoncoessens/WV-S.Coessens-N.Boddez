% in linprog the bounds gaan checken van n
% k is the sparsity 
% alg = {'lin','GNU'}
% p: percentage van testen met perfecte reconstructie
function reconstruction = Test(n,m,k,p)

% Initialize al the necessary variables

% init linprog vars
total_succes = 0;
for i=1:100
    [f, A, b, Aj, bj, lb, ub, result] = TestSetupNoisyLinprog(n,m,k);
    options = optimoptions('linprog','Display','none'); 
    x = linprog(f, -A, -b, Aj, bj, lb, ub, options);
    succes = isequal(x(1:n), result);
    total_succes = total_succes + succes;
end


% true als reconstructieniveau boven p ligt
if (total_succes/100) > p
    reconstruction = true;
else
    reconstruction = false;
end
