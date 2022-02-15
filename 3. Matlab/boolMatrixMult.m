function [y] = boolMatrixMult(A,x)
    x = x';
    m = size(A);
    y = zeros(m(1), 1);
    for i = 1:length(y)
        for j = 1:length(x)
            if A(i,j) == 1 && x(j)
                y(i)= 1;
            end
        end
    end
end