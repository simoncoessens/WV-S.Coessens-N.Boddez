% Group testing model solver using compressed sampling
% n = group size
% k = number of infected persons
% m = number of tests
function [succes] = group_tester_mosek(n, k, m)

% vector that contains the exact result (1 entry for infected person)
% pos_idx = vector containing indices of k number of infected persons
result = zeros(n,1); 
pos_idx = round((n-1)*rand(k,1)) + 1;
pos_idx = sort(pos_idx);
for i = 1:k
   result(pos_idx(i)) = 1;
end

% A = Measurement matrix containing lineair combinations of samples
% m = measurement size
% p = P(A_i,j == 1) = de kans dat een individu in een test zit
p = 1/k;
A = double(rand(m,n) < p);        


% b = undersampled measurement, b = A v result
b = double(logical(A*result));


J = []; % indices waarvoor A*x = 0
I = []; % ander indices
count_J = 1;
count_I = 1;
for i = 1:size(b, 1)
    if b(i) == 1
        I(count_I) = i;
        count_I = count_I + 1;
    else
        J(count_J) = i;
        count_J = count_J + 1;
    end
end

% f(x) wordt geminimaliseerd 
% zodat Ai*x <= bi en
% Aj * x = 0 en (Aj = zie Malioutov problem in (8))
% lbx <= x <= ubx
f = ones(n,1);
lbx = zeros(n,1); %lowerbound x
ubx = ones(n,1);  %upperbound x

lbb = b; %lowerbound b
ubb = zeros(m,1);
for i = 1:size(I,2)
    ubb(I(i)) = Inf;
end

% make prob(lem) struct
prob   = [];
prob.c = f;
prob.a = sparse(A);
prob.blc = lbb;
prob.buc = ubb;
prob.blx = lbx;
prob.bux = ubx;
% GEBRUIK param OM TE KIEZEN WELKE OPTIMIZER GEBRUIKT WORDT
% (https://docs.mosek.com/latest/toolbox/solver-parameters.html#doc-solver-parameters)
param=[];
cmd = 'minimize';

[rcode,res] = mosekopt(cmd,prob,param);

res.rcode   = rcode;
sol = res.sol;

% Interior-point solution.
sol.itr.xx      % x solution.

% Basic solution.
sol.bas.xx      % x solution in basic solution.

succes = isequal(sol.bas.xx, result);
end

