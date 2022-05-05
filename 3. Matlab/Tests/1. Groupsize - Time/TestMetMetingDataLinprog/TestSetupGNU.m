function [c, A, b, lb, ub, ctype, vartype, sense, param] = TestSetupGNU(n,m,k)

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


c = ones(1,n);

lb = zeros(n,1);
ub = ones(n,1);

ctype = char('L'*zeros(m,1));
for i = 1:m
    if b(i) == 0
        ctype(i,1) = 'S';
    else
        ctype(i,1) = 'L';
    end    
end

vartype = char('C'*ones(n,1));
sense = 1;
param.msglev=1;