function [x] = RLP(xp, y, A, eps)
    x = zeros(length(xp), 1);
    I = zeros(1);
    idx = 1;
    for i = 1: length(y)
        if y(i) == 1
            I(idx) = i;
            idx = idx + 1;
        end
    end

    for l = 1:ceil(log(length(I)/eps))
        xl = zeros(size(xp));
        for i = 1 : length(xp)
            xl(i) = rand(1,1) < xp(i);
        end
        x = x | xl;
        if boolMatrixMult(A, xl) == y
            return
        end
    end

end