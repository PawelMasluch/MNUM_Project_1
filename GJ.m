function x = GJ(A, b, n)
% Metoda eliminacji zupelnej Gaussa-Jordana
% Zalozenie: A(i,i) ~= 0 dla i=1,2,...,n


for i=1:n
    
    b(i) = b(i) / A(i,i);
    A(i,:) = A(i,:) / A(i,i);
    
    
    for j=1:n
        if j ~= i
            b(j) = b(j) - A(j,i) * b(i);
            A(j,:) = A(j,:) - A(j,i) * A(i,:);
        end
    end
    
end


x = b;

end

