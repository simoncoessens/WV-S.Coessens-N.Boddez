load('filename.mat');
%load('1_2600.mat');
% heatmap maken
result = flipud(result);
[max_row, max_collumn] = size(result);
n = 100:100:10000;
m = 1:20:4541;
%m = 1800.-m;

f = figure;
hold on
f.Position = [100 100 600 400];
title('Reconstructiegraad');
xlabel('Groep grootte')
ylabel('Aantal metingen')
xlim([0 10000]);
ylim([0 4541]);

imagesc(n,m,result)
colormap pink
colorbar
%set(gca,'YDir','normal')
%colormap default
%colorbar
set(gca,"FontSize",14);

%set(gca, 'YDir','reverse')
%heatmap(n,m,result);
%surf(n,m,result);
%imagesc(n,m,result);