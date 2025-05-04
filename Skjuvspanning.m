
function [tau_shear] = Skjuvspanning(n,xvec,F_f)

%konstanter
D = 0.020; 
d = 0.010;
L = 0.057;

tau_shear = zeros(length(xvec),1);

xvec = linspace(0, L, 100);
V = zeros(size(xvec));  % initiera vektor
h = L/n;

counter = 0;

for x = 0:h:L
        counter = counter + 1;  
        A = (pi*(D^2-d^2))/4;

        if x == 0 || x==L
            V(counter) = 0;
        else
            V(counter) = F_f/2;

        end

        tau_shear(counter) = 4 * V(counter) / (3 * A);
end

end



