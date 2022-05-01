% Group testing model solver using compressed sampling
% n = group size
% k = number of infected persons
% m = number of tests
function succes = noisy_group_tester_mosek(n, k, m)

% vector that contains the exact result (1 entry for infected person)
% pos_idx = vector containing indices of k number of infected persons
result = zeros(n,1); 
pos_idx = round((n-1)*rand(k,1)) + 1;
result(pos_idx) = 1;

% A = Measurement matrix containing lineair combinations of samples
% m = measurement size
% p = P(A_i,j == 1) = de kans dat een individu in een test zit
p = 1/k;
A = double(rand(m,n) < p);        


% b = undersampled measurement, b = A v result
b = double(logical(A*result));


% f(x) wordt geminimaliseerd 
% zodat Ai*x <= bi en
% Aj * x = bj en (Ai en Aj = zie Malioutov problem in (8))
% lb <= x <= ub

% Add noise
noise = rand(size(b)) < 0.05;
noisy_b = b;
noisy_b(noise) = not(noisy_b(noise));

% Add extra rows to A to make it compattible with slack variables
A_slack = eye(size(A, 1));
A_slack(:,logical(not(noisy_b))) = -A_slack(:,logical(not(noisy_b)));
A = [A A_slack];

f = ones(size(A, 2), 1);
f(n:size(A,2)) = 1; % alpha
lbx = zeros(size(A, 2),1);
ubx = ones(size(A, 2),1);
lbb = noisy_b; %lowerbound b
ubb = zeros(m,1);

% Update upperbound for slack vars in J
ubx(logical([zeros(n,1);not(noisy_b)])) = Inf;

% Set the upper bound for bi to Inf
ubb(logical(noisy_b)) = Inf;


% make prob(lem) struct
prob   = [];
prob.c = f;
prob.a = sparse(A);
prob.blc = lbb;
prob.buc = ubb;
prob.blx = lbx;
prob.bux = ubx;
param=[];
%param.MSK_IPAR_OPTIMIZER = 'MSK_OPTIMIZER_INTPNT'; % kies solver
cmd = 'minimize echo(0)'; % echo(0) = geen output

[rcode,res] = mosekopt(cmd,prob,param);

res.rcode   = rcode;
sol = res.sol;

% Interior-point solution.
%sol.itr.xx      % x solution.

% Basic solution.
%sol.bas.xx      % x solution in basic solution.

succes = isequal(sol.bas.xx(1:n), result);
end


