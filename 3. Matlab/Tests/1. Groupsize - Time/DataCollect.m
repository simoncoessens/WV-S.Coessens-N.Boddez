% Tijdsmeting in functie van groepsgrootte
k = 2/100;
n_start = 1;
n_step = 10;
n_max = 1000;
iter = 100;

% dit percentage bepaald het aantal testen dat we doen, zeker experimenteel
% controleren of dit wel volledige reconstructie geeft
m_perc = 0.4;

result = zeros(1);
count = 1;

for n=n_start:n_step:n_max
    disp(n);
    m = round(n*m_perc);
    temp = 0;
    for i=1:iter
        temp = temp + Test(n,m,k,'lin');
    end
    result(count) = temp/iter;
    count = count + 1;
end


result = result';
save('filename');

