function [N1, N2] = LastfordelningSidaFunktion()

    % Givna parametervärden
    B1 = 0.46596;                     % Masscentrums läge relativit vänster hjul [m]
    B2 = 0.41404;                     % Masscentrums läge relativit höger hjul [m]
    H1 = 0.27873;                     % Masscentrums läge över marknivån [m]
    m  = 133.583;                       % Massa hos fordon ink. förare
    mu = 0.8;                       % Friktion mellan däck och vägbana [-]
    g  = 9.81;                      % Tyngdaccelation [m/s^2]

    % Bestämning av masscentrums maximala höjd över marken för att undvika tippning
    Bmin = min(B1,B2);              % Avgör minsta avstånd från masscentrum till hjul [m]
    H1max = Bmin/mu;                % Beräknar maximalt tillåtet värde på H1

    % Bestämning av maximal kurvhastighet för att undvika sladd
    R = [5:20];                     % Kurvradier [m]
    v  = sqrt(mu*g*R);              % Maximal hastiget för att undvika sladd [m/s]

    % Bestämning av normalkrafter i olika körfall
    % Vänsterkurva på gränsen till sladd
    N1(1) = m*g*(B2-mu*H1)/(B1+B2); % Normalkraft på vänster sida [N]
    N2(1) = m*g -N1(1);             % Normalkraft på höger sida [N]
    % Körning rakt fram
    N1(2) = m*g*B2/(B1+B2);         % Normalkraft på vänster sida [N]
    N2(2) = m*g -N1(2);             % Normalkraft på höger sida [N]
    % Högerkurva på gränsen till sladd
    N1(3) = m*g*(B2+mu*H1)/(B1+B2); % Normalkraft på vänster sida [N]
    N2(3) = m*g -N1(3);             % Normalkraft på höger sida [N]

end
