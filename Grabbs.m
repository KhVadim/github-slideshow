function X = Grabbs(x, alph)
S = std(x); %СКО
M = mean(x); %МО
N = length(x); 
c = abs(x-M); 
n = find (~(c-max(c))); %ищу номер макс отклонения
K = max(c) / S; 
Ktabl = ((N - 1) / sqrt(N)) * sqrt(tinv(alph / (N), N - 2)^2 / (N - 2 + tinv(alph / (N), N - 2)^2));
if (K > Ktabl)
    x(n) = [];
    X = Grabbs(x, alph);
else X = x;
end
end