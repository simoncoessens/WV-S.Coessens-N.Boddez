load('aantal_m_1000_191000.mat');

% gewone plot
f = figure;
f.Position = [100 100 600 400];
hold on
title('Reconstructielijn');
xlabel('Groep grootte')
ylabel('Aantal testen')

plot(result(:,1),result(:,2),LineWidth=2);

set(gca,"FontSize",14);


% plot van de percenten
%prctn = result(:,2) ./ result(:,1);
%figure;
%plot(result(:,1),prctn);