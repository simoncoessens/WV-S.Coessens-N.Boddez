load('100-1000.mat');

% gewone plot
figure;
plot(result(:,1),result(:,2));


% plot van de percenten
prctn = result(:,2) ./ result(:,1);
figure;
plot(result(:,1),prctn);