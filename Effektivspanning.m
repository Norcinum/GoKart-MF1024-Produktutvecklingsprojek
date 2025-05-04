function [sigmae] = Effektivspanning(n,xvec,sigma,tau, M, N)

d = 0.015; %lilla axeln diameter
D = 0.020; %stora axeln diameter
KtN = 2.0; %Kt drag
KtM = 1.75; %Kt böj

sigmae = zeros(length(xvec),1);

h = xvec(end)/n;
counter = 0;
for x = 0:h:xvec(end)
    counter = counter + 1;
    
    if x == 0.065
        sigmakonc = KtN * 4*N(counter)/(pi*d^2) + KtM * 32*M(counter)/(pi*d^3);
        sigmae(counter) = sqrt(sigmakonc^2);
    else

        sigmae(counter) = sqrt(sigma(counter)^2 + 3*tau(counter)^2);
    end
end
end