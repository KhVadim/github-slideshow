close all; clear all; clc;
sigm1 = xlsread ('Vse_izmerenia.xlsx', 2, 'A:A')';
hist (sigm1, 8)
grid on
title ('Гистограмма для разрывной силы с учетом грубых ошибок')
sigm1 = sort(sigm1);
alpha = 0.11;
lam = linspace(sigm1(1), sigm1(32)+0.1, 5);
N = length(sigm1);
mu = mean(sigm1);
s = std(sigm1);
p = zeros(1, length(lam)-1);
n = zeros(1, length(lam)-1);
for i = 1:4
       for j = 1:N
       if (sigm1(j) >= lam(i) && sigm1(j) < lam(i + 1))
           n(i) = n(i) + 1;
       end
       end
end
lam(1) = -Inf; lam(5) = Inf;
for i = 1:4
    p(i) = normcdf(lam(i + 1), mu, s) - normcdf(lam(i), mu, s);
end
krit1 = sum((n.^2) ./ (N.*p)) - N;
ent = chi2inv(0.89, 1);
sigm1 = Grabbs (sigm1, alpha);
figure
hist (sigm1, 8)
grid on
title ('Гистограмма для разрывной силы без учета грубых ошибок')
lam = linspace(sigm1(1), sigm1(length(sigm1)) + 0.1, 5);
munew = mean(sigm1);
snew = std(sigm1);
n = zeros (1, 4);
for i = 1:4
       for j = 1:length(sigm1)
       if (sigm1(j) >= lam(i) && sigm1(j)<lam(i+1))
           n(i) = n(i) + 1;
       end
       end
end
lam(1) = -Inf; lam(5) = Inf;
for i = 1:4
    p(i) = normcdf(lam(i + 1), munew, snew) - normcdf(lam(i), munew, snew);
end
krit2 = sum((n.^2) ./ (length(sigm1) .* p)) - length(sigm1);
NST = length(sigm1);
t = [1.7 2 2.5; -1.7 -2 -2.5] ./ sqrt(NST);
bound = munew + snew * t
