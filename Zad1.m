% eps - poszukiwana dokladnosc maszynowa
% t - liczba calkowita, dla ktorej 2^t = eps

format long;

eps = 1;
t = 0;
while 1 + eps > 1
    eps = eps/2;
    t = t - 1;
end

eps = eps*2;
t = t + 1;

fprintf( 'Dokladnosc maszynowa mojego kompuera wynosi 2^(%s) = %s\n', num2str(t), num2str(eps) );