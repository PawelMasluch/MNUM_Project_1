n = [5 10 50 100 200]';
eps1 = zeros( length(n), 1 );
T = zeros( length(n), 1 );

for k=1:length(n)
    
    
    % Wygenerowanie macierzy A
    % A(i,j) = 1/3 dla i=j
    % A(i,j) = 3*(i-j)+3 dla pozostalych
    A = zeros( n(k) );

    for i=1:n(k)
        for j=1:n(k)
            if i==j
                A(i,j) = 1/3;
            else
                A(i,j) = 3*(i-j)+3;
            end 
        end
    end
    
    
    
    
    % Wygenerowanie wektora b
    % b(i) = 0.5 - 0.6*i
    b = zeros( n(k), 1 );

    for i=1:n(k)
        b(i) = 0.5 - 0.6*i;
    end
    
    
    
    
    tic;
    x = GJ( A, b, n(k) );
    T(k) = toc;
    
    
    
    eps1(k) = norm( A*x - b );
end



T = T .* 1000; % aby wyniki byly w ms 



% Wykres bledu rozwiazania od liczby rownan
figure(1);
hold on;

plot(n,eps1,'r.', 'MarkerSize', 25);
grid on;

title('Zale�nosc bledu rozwiazania od liczby rownan (czesc b))');
xlabel('Liczba rownan n');
ylabel('Blad rozwiazania eps1');

hold off;



% Wykres czasu dzialania algorytmu od liczby rownan
figure(2);
hold on;

plot(n,T,'r.', 'MarkerSize', 25);
grid on;

title('Zaleznosc czasu dzialania algorytmu od liczby rownan (czesc b))');
xlabel('Liczba rownan n');
ylabel('Czas dzia�ania algorytmu [ms]');

hold off;
