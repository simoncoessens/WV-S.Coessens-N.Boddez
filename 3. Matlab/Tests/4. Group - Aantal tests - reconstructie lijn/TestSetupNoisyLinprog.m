function [f, Ai, bi, Aj, bj, lb, ub, result] = TestSetupNoisyLinprog(n,m,k_percent)

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
A = logical(sprand(m,n,p));

% b = undersampled measurement, b = A v result
b = double(logical(A*result));

% Add noise
noise = rand(size(b)) < 0.05;
noisy_b = b;
noisy_b(noise) = not(noisy_b(noise));

bj = zeros(m-norm(noisy_b,1),1);
bi = ones(norm(noisy_b,1),1);

% Add extra rows to A to make it compattible with slack variables
A = [A eye(size(A, 1))];
A = sparse(A);

%------ oplossing via linprog ------
% f(x) wordt geminimaliseerd 
% zodat Ai*x <= bi en
% Aj * x = bj en (Aj = zie Malioutov problem in (8))
% lb <= x <= ub
f = ones(n+m, 1);
f(n:end) = 1; % alpha
lb = zeros(n+m,1);
ub = ones(n+m,1);

% Split A up in Ai and Aj
Ai = A(logical(noisy_b), :);
Aj = A(logical(not(noisy_b)), :);
% Make slack vars negative in Aj
Aj(:, n+1:end) = -Aj(:, n+1:end);

% Set upperbound for slack vars in J
ub(logical([zeros(n,1);not(noisy_b)])) = Inf;

