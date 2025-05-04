function [sigma, tau] = Spanning(n,xvec,N,M,T)

%konstanter
r1 = 0.015; %tjockleksradie axel innan dimövergång
r2 = 0.020; %tjockleksradie axel efter dimövergång

sigma = zeros(length(xvec),1);
tau = zeros(length(xvec),1);
h = xvec(end)/n;
counter = 0;

for x = 0:h:xvec(end)
        counter = counter + 1;

        if x <= 0.065
            
            A = pi*r1^2;
            Wb = pi*(r1^3)/4;
            sigma(counter) = N(counter)/A + M(counter)/Wb;
            tau(counter) = T(counter)/A;

        else

            A = pi*r2^2;
            Wb = pi*(r2^3)/4;
            sigma(counter) = N(counter)/A + M(counter)/Wb;
            tau(counter) = T(counter)/A;
        end

end

end