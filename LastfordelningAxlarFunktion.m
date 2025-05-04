function [N1] = LastfordelningAxlarFunktion()

    % Givna in data
    % Massa och masscentrum för gokart inkl. förare
    L1   = 0.77435;
    L2   = 0.47343;
    H1   = 0.27873;
    m    = 133.583;     % Massa inkl. förare [kg]
    r    = 0.127;   % Hjulradie [m]
    % Data för drivlinan
    u    = 2;       % Utväxling [-]
    eta  = 0.95;    % Verkningsgrad [-]
    Mmax = 11.2;      % Maximalt motormoment enligt datablad [Nm]
    % Fysikaliska parametrar
    mu  = 0.8;      % Friktionstal mellan däck och vägbana [ - ]
    g   = 9.81;     % Tyngdacceleration [m/s^2]

    % Beräkning av lastfördelning mellan fram och bakaxel för olika körfall
    % Acceleration med maximalt motormoment
    F(1) = u*eta*Mmax/r;                % Drivande kraft [N]
    a(1) = F(1)/m;                      % Acceleration [m/s^2]
    N1(1)= (m*g*L2 -F(1)*H1)/(L1+L2);
    N2(1)= m*g -N1(1);
    % Konstant hastighet
    F(2) = 0;
    a(2) = F(2)/m;
    N1(2)= (m*g*L2 -F(2)*H1)/(L1+L2);
    N2(2)= m*g -N1(2);
    % Retardation med låst broms
    N2(3)= m*g*L1/(L1+L2+mu*H1) ;
    N1(3)= m*g -N2(3);
    F(3) = -mu*N2(3);
    a(3) = F(3)/m;
    
    end