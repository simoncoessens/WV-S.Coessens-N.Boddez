% Group testing model solver using compressed sampling
% n = group size
% k = number of infected persons
% m = number of tests
function succes = group_tester(n, k, m)

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


% f(x) wordt geminimaliseerd 
% zodat Ai*x <= bi en
% Aj * x = 0 en (Aj = zie Malioutov problem in (8))
% lb <= x <= ub
f = ones(n,1);
lb = zeros(n,1);
ub = ones(n,1);

% Split A up in Ai and Aj
Aj = zeros(0);
Ai = zeros(0);
for i = 1:m
    if b(i) == 0
        Aj = [Aj ; A(i,:)];
    else 
        Ai = [Ai ; A(i,:)];
    end
end

bj = zeros(m-norm(b,1),1);
bi = ones(norm(b,1),1);

options = optimoptions('linprog', 'Display', 'off');
%options = optimoptions('linprog');

x = linprog(f, -Ai, -bi, Aj, bj, lb, ub, options);
%x = linprog(f, -A, -b);

% Random Lineair Programming
x = RLP(x, b, A, 1e-5);

succes = isequal(x, result);



