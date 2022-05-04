function [f, Ai, bi, Aj, bj, lb, ub, result] = TestSetupLinprog(n,m,k_percent)

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

%------ oplossing via linprog ------
% f(x) wordt geminimaliseerd 
% zodat Ai*x <= bi en
% Aj * x = bj en (Aj = zie Malioutov problem in (8))
% lb <= x <= ub
f = ones(n,1);
lb = zeros(n,1);
ub = ones(n,1);

bj = zeros(m-norm(b,1),1);
bi = ones(norm(b,1),1);

% Split A up in Ai and Aj
Ai = A(logical(b), :);
Aj = A(logical(not(b)), :);