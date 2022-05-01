% naar normale richting brengen, (matlab telt naar beneden)
result = flipud(result);
[max_row, max_collumn] = size(result);

% 1tjes vullen
for i=1:max_collumn
    for j=1:max_row
        if result(j,i) > p
            break;
        else
            % perfecte reconstructie boven onze graad van p
            result(j,i) = 1;
        end
    end
end

% heatmap maken
n = 1:100:4800;
m = 1:step_m:max_row;
imagesc(n,m,result)
colormap default
colorbar
