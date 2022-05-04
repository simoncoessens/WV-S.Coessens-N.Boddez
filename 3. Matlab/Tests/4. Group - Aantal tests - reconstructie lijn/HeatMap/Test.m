% in linprog the bounds gaan checken van n
% k is the sparsity 
% alg = {'lin','GNU'}
% p: percentage van testen met perfecte reconstructie
function reconstruction = Test(n,m,k)

% Initialize al the necessary variables

% init linprog vars
total_succes = 0;
for i=1:100
    [cmd, prob, param, result] = TestSetupMosek(n,m,k);
    [~,res] = mosekopt(cmd,prob,param);
    total_succes = total_succes + isequal(res.sol.bas.xx, result);
end


reconstruction = total_succes/100;
