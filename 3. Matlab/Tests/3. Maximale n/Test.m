% in linprog the bounds gaan checken van n
% k is the sparsity 
% alg = {'lin','GNU'}
function elapsed_time = Test(n,m,k)

% Initialize al the necessary variables

% init linprog vars
[f, A, b, Aj, bj, lb, ub] = TestSetupLinprog(n,m,k);

% voer timing uit
tic;
linprog(f, -A, -b, Aj, bj, lb, ub, options);
elapsed_time = toc;

