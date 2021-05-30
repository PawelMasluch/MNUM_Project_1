function x = GS(A, b, n, eps2, max_iter)
% Metoda iteracyjna Gaussa-Seidela
% Zalozenie: A(i,i)~=0 dla i=1,2,...,n




% Dekompozycja macierzy A
% L - macierz poddiagonalna
% D - macierz diagonalna
% U - macierz naddiagonalna

L = zeros(n);
D = zeros(n);
U = zeros(n);

for i=1:n
    for j=1:n
        if i==j
            D(i,i) = A(i,i);
        elseif i < j
            U(i,j) = A(i,j);
        else
            L(i,j) = A(i,j);
        end
    end
end




x = zeros(n,1); % przyblizenie startowe
xNext = zeros(n,1); % zmienna pomocnicza: kolejne przyblizenie rozwiazania 


iter = 1;

while 1
    w = U*x - b;
    
    for i=1:n
        
        sum = 0;
        
        for j=1:i-1
            sum = sum + L(i,j) * xNext(j);
        end
        
        xNext(i) = (-w(i) - sum) / D(i,i);
        
    end
    
    if norm( xNext - x ) < eps2 || iter > max_iter
        x = xNext;
        break;
    else
        x = xNext;
        iter = iter + 1;
    end
    
end


end

