function [M, N, T] = Snittstorheter(n, F_rA, F_rB, F_a1)
    
    %definierar konstanter
    L = 0.140;
    h = L/n;
    counter = 0;
    M = zeros(n,1);
    N = zeros(n,1);
    T = zeros(n,1);
    L1 = 0.005;
    L2 = 0.07;
    for x= 0:h:L

        counter = counter + 1;
        M(counter) = (-F_rA)*(x-L1) - F_rB*(x-L2);
        T(counter) = -F_rA - F_rB;
        N(counter) = - F_a1;

    end


end
