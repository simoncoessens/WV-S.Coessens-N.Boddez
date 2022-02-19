% Group testing model solver using compressed sampling
% n = group size
% p = probability that a person is infected 

n = 1000;
p = 0.01;
inf_pers = round(n*p);

% vector that contains the exact result (1 entry for infected person)
% pos_idx = vector containing indices of n*p number of infected persons
result = zeros(n,1); 
pos_idx = round((n-1)*rand(inf_pers,1)) + 1;
pos_idx = sort(pos_idx);
for i = 1:(inf_pers)
   result(pos_idx(i)) = 1;
end

% A = Matrix containing lineair combinations of samples
% m = measurement size
m = 6*inf_pers;
A = round(rand(m,n));        


% b = undersampled measurement, b = A v result
b = boolMatrixMult(A, result);


% b = undersampled measurement

% b = A*result;

%b = zeros(m,1);
%for i = 1:inf_pers
%    for j = 1:m
%        if A(j,pos_idx(i)) == 1
%            b(j)= b(j) + 1;
%            %b(j)= 1;
%        end
%    end
%end


% y = l_2 solution to A*y = b.
y = pinv(A)*b;

% Solve compressed sensing problem with l1 optimization
% x = l_1 solution to A*x = b.
% Use "L1 magic".

x = l1eq_pd(y,A,A',b,5e-3,32);

% Random Lineair Programming
x = RLP(x, b, A, 1e-100);

result_undersampled = zeros(inf_pers,1);
count = 1;
for i = 1:n
    if x(i) == 1
        result_undersampled(count) = i;
        count = count + 1;
    end
end
result_undersampled = sort(result_undersampled);


% Check exactness of reconstruction
err = 0;
for i =1:inf_pers
    if x(pos_idx(i))~=1 
        err = err +1;
    end
end


err_p = (1 - err/inf_pers)*100;


fprintf('The solution is %f percent correct\n',err_p)

% Absolute and relative error of reconstruction (using l1 norm)
abs_err = norm(result-x, 1);
rel_err = abs_err/norm(result, 1);
fprintf('Absolute error = %f, \nRelative error = %f \n', abs_err, rel_err)

