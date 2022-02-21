function [x] = RLP(xp, y, A, eps)
    n = length(xp);
    x = zeros(n,1);

    % length(I) = norm(y,1) dus moeten we I niet eens berekenen

    for l = 1:ceil(log(norm(y,1)/eps))
        xl = zeros(n,1);
        for i = 1 : n
            xl(i) = rand(1,1) < xp(i);
        end
        x = x | xl;
        if logical(A*xl) == y
            return
        end
    end

end