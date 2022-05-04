function [cmd, prob, param, result] = TestSetupNoisyMosek(n, m, k_percent)

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
A = double(logical(sprand(m,n,p)));        


% b = undersampled measurement, b = A v result
b = double(logical(A*result));

% Add noise
noise = rand(size(b)) < 0.05;
noisy_b = b;
noisy_b(noise) = not(noisy_b(noise));

% Add extra rows to A to make it compattible with slack variables
A_slack = eye(size(A, 1));
A_slack(:,logical(not(noisy_b))) = -A_slack(:,logical(not(noisy_b)));
A = [A A_slack];

% c(x) wordt geminimaliseerd 
% zodat blc <= A*x <= buc en
% blx <= x <= bux
prob   = [];
prob.c = ones(n+m, 1);
prob.c(n:end) = 1; % alpha
prob.a = sparse(A);
prob.blc = noisy_b; %lowerbound b
prob.buc = zeros(m,1); %upperbound b
prob.buc(logical(noisy_b)) = Inf;
prob.blx = zeros(n+m,1); %lowerbound x
prob.bux = ones(n+m,1);  %upperbound x
prob.bux(logical([zeros(n,1);not(noisy_b)])) = Inf;

param=[];
%param.MSK_IPAR_OPTIMIZER = 'MSK_OPTIMIZER_INTPNT'; % kies solver

cmd = 'minimize echo(0)'; % echo(0) = geen output
end

