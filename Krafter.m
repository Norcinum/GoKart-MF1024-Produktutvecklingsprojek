% clear all
% close all
% 
% m = 133.583; %Massa hos fordon inkl. förare [kg]
% mu = 0.8; %friktion mellan däck och vägbana
% g = 9.81; %tyngdaccelerationen [m/s^2]

function [N_hf, N_vf, F_fh, F_fv] = Krafter(m,mu,g)
    
    % Importerar normalkrafter från LastfordelningSida och LastfordelningAxlar
    [N_h, N_v] = LastfordelningSidaFunktion(); %importerar normalkrafter på sidorna för alla fall
    [N_f] = LastfordelningAxlarFunktion(); %importerar normalkrafter fram för alla fall

    N_f_andel = []; %skapar tom lista

    for i = 1:3     %beräknar procentuella andelen av normalkfrafterna som är fram i varje fall
        N_f_andel(i) = (N_f(i)/(m*g));
    end
    
    % Körning rakt fram
    %beräknar normalkrafter
    N_hf(1) = N_h(2)*N_f_andel(2); %höger sida
    N_vf(1) = N_v(2)*N_f_andel(2); %vänster sida
    F_fh(1) = 0; %höger sida
    F_fv(1) = 0; %vänster sid

    %Beräknar krafter för vänsterkurva
    N_hf(2) = N_h(1)*N_f_andel(2); %höger sida
    N_vf(2) = N_v(1)*N_f_andel(2); %vänster sida
    F_fh(2) = mu*N_hf(2); %höger sida
    F_fv(2) = mu*N_vf(2); %vänster sida
    
    % Beräknar krafter för högerkurva
    N_hf(3) = N_h(3)*N_f_andel(2); %höger sida
    N_vf(3) = N_v(3)*N_f_andel(2); %vänster sida
    F_fh(3) = mu*N_hf(3); %höger sida
    F_fv(3) = mu*N_vf(3); %vänster sida

    %Beräknar krafter för acceleration
    N_hf(4) = N_h(2)*N_f_andel(1); %höger sida
    N_vf(4) = N_v(2)*N_f_andel(1); %vänster sida
    F_fh(4) = 0;
    F_fv(4) = 0;
    
    % Beräknar krafter för bromsning med låsning
    N_hf(5) = N_h(2)*N_f_andel(3); %höger sida
    N_vf(5) = N_v(2)*N_f_andel(3); %vänster sida
    F_fh(5) = 0;
    F_fv(5) = 0;
end