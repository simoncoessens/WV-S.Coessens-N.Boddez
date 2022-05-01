% Group testing model solver using compressed sampling
% n = group size
% k = number of infected persons
% m = number of tests
function succes = noisy_group_tester(n, k, m)

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

bj = zeros(m-norm(noisy_b,1),1);
bi = ones(norm(noisy_b,1),1);

% Add extra rows to A to make it compattible with slack variables
A_original = A;
A = [A eye(size(A, 1))];
A = sparse(A);

f = ones(size(A, 2), 1);
f(n:size(A,2)) = 1; % alpha
lb = zeros(size(A, 2),1);
ub = ones(size(A, 2),1);

% Split A up in Ai and Aj
Ai = A(logical(noisy_b), :);
Aj = A(logical(not(noisy_b)), :);
% Make slack vars negative in Aj
Aj(:, n+1:end) = -Aj(:, n+1:end);

% Set upperbound for slack vars in J
ub(logical([zeros(n,1);not(noisy_b)])) = Inf;


%options = optimoptions('linprog', 'Display', 'off');
options = optimoptions('linprog');

linprog_solution = linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);

x = linprog_solution(1:n);
slack = linprog_solution(n+1:size(linprog_solution));

% Random Lineair Programming
x = RLP(x, b, A_original, 1e-5);

succes = isequal(x, result);



