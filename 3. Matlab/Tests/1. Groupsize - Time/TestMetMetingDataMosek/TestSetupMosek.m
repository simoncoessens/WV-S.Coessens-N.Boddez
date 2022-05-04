function [cmd, prob, param, result] = TestSetupMosek(n, m, k_percent)

% aantal positieven
k = round(n*k_percent);

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

% c(x) wordt geminimaliseerd 
% zodat blc <= A*x <= buc en
% blx <= x <= bux
prob   = [];
prob.c = ones(n,1);
prob.a = sparse(A);
prob.blc = b; %lowerbound b
ubb = zeros(m,1); %upperbound b
ubb(logical(b)) = Inf;
prob.buc = ubb;
prob.blx = zeros(n,1); %lowerbound x
prob.bux = ones(n,1);  %upperbound x

param=[];
%param.MSK_IPAR_OPTIMIZER = 'MSK_OPTIMIZER_INTPNT'; % kies solver

cmd = 'minimize echo(0)'; % echo(0) = geen output
end

