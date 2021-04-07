function X = Grabbs(x, alph)
S = std(x); %���
M = mean(x); %��
N = length(x); 
c = abs(x-M); 
n = find (~(c-max(c))); %��� ����� ���� ����������
K = max(c) / S; 
Ktabl = ((N - 1) / sqrt(N)) * sqrt(tinv(alph / (N), N - 2)^2 / (N - 2 + tinv(alph / (N), N - 2)^2));
if (K > Ktabl)
    x(n) = [];
    X = Grabbs(x, alph);
else X = x;
end
end