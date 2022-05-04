% in linprog the bounds gaan checken van n
% k is the sparsity 
% alg = {'lin','GNU'}
% p: percentage van testen met perfecte reconstructie
function reconstruction = Test(n,m,k,p)

% Initialize al the necessary variables

% init linprog vars
total_succes = 0;
for i=1:20
    disp(["iter:" num2str(i)]);
    % init mosek
    %[cmd, prob, param, result] = TestSetupNoisyMosek(n,m,k);
    %[~,res] = mosekopt(cmd,prob,param);
    [cmd, prob, param, result] = TestSetupMosek(n,m,k);
    [~,res] = mosekopt(cmd, prob, param);
    
    succes = isequal(res.sol.bas.xx, result);
    total_succes = total_succes + succes;
    disp(total_succes);
end

disp(total_succes/20);
% true als reconstructieniveau boven p ligt
if (total_succes/20) > p
    reconstruction = true;
else
    reconstruction = false;
end

