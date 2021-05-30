% n = 5
% A = G * G^T, gdzie G = 10*rand(5)
% b = 30 * rand(5,1)

format long;

n = 5;
G = 10 * rand(5);
A = G * G.'; % A = G * G^T
b = 30 * rand(5,1);

tic;
x = GJ(A,b,n);
toc;

eps1 = norm( A*x - b );
fprintf('Blad obliczonego rozwiazania wynosi eps1 = %s\n', num2str(eps1));
    