load('100_19100_noiseless.mat');

% gewone plot
f = figure;
f.Position = [100 100 600 400];
hold on
%title('Reconstructielijn');
xlabel('Groepsgrootte')
ylabel('Aantal testen')

plot(result(:,1),result(:,2),LineWidth=1.5);

set(gca,"FontSize",14);


% plot van de percenten
%prctn = result(:,2) ./ result(:,1);
%figure;
%plot(result(:,1),prctn);