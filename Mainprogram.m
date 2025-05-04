clear all
clc
clf
close all

%Konstanter
m = 133.583; %Massa hos fordon inkl. förare [kg]
mu = 0.8; %friktion mellan däck och vägbana
g = 9.81; %tyngdaccelerationen [m/s^2]
L_D = 0.130; %däckets bredd
n = 140; %antal steg vi tar längs axeln
x = 0.005; %avstånd från lagerna till kanterna på axeln

xvec = linspace(0, 0.140, n+1)';
L = linspace(0, 0.057, n+1)';

%% Beräkning av lagerkrafter för samtliga fall

[N_hf, N_vf, F_fh, F_fv] = Krafter(m,mu,g);

for i = 1:5
    %vänster hjul
    F_a1v(i) = F_fv(i);
    F_rBv(i) = N_vf(i)/(((-L_D)/2 - x)/x + 1);
    F_rAv(i) = (-F_rBv(i)*((L_D/2)-x))/x;
    N = F_rAv(i) + F_rBv(i);

    %höger hjul
    F_a1h(i) = F_fh(i);
    F_rBh(i) = N_hf(i)/(((-L_D)/2 - x)/x + 1);
    F_rAh(i) = (-F_rBh(i)*((L_D/2)-x))/x;
    N = F_rAh(i) + F_rBh(i);

end

%% Beräkning av storheter: rakt fram

%Snittstorheter
[Mrakv, Nrakv, Trakv] = Snittstorheter(n, F_rAv(1), F_rBv(1), F_a1v(1)); %vänster hjul
[Mrakh, Nrakh, Trakh] = Snittstorheter(n, F_rAh(1), F_rBh(1), F_a1h(1)); %höger hjul

%Spänningar
[sigmarakv, taurakv] = Spanning(n,xvec,Nrakv,Mrakv,Trakv);
[sigmarakh, taurakh] = Spanning(n,xvec,Nrakh,Mrakh,Trakh);

%Effektivspänning
[sigmaerakv] = Effektivspanning(n,xvec,sigmarakv,taurakv,Mrakv,Nrakv);
[sigmaerakh] = Effektivspanning(n,xvec,sigmarakh,taurakh,Mrakh,Nrakh);

%% Beräkning av snittstorheter: vänsterkurva

%Snittstorheter
[Mvansterv, Nvansterv, Tvansterv] = Snittstorheter(n, F_rAv(2), F_rBv(2), F_a1v(2)); %vänster hjul
[Mvansterh, Nvansterh, Tvansterh] = Snittstorheter(n, F_rAh(2), F_rBh(2), F_a1h(2)); %höger hjul

%Spänningar
[sigmavansterv, tauvansterv] = Spanning(n,xvec,Nvansterv,Mvansterv,Tvansterv);
[sigmavansterh, tauvansterh] = Spanning(n,xvec,Nvansterh,Mvansterh,Tvansterh);

%Effektivspänning
[sigmaevansterv] = Effektivspanning(n,xvec,sigmavansterv,tauvansterv,Mvansterv,Nvansterv);
[sigmaevansterh] = Effektivspanning(n,xvec,sigmavansterh,tauvansterh,Mvansterh,Nvansterh);

%% Beräkning av storheter: högerkurva

%Snittstorheter
[Mhogerv, Nhogerv, Thogerv] = Snittstorheter(n, F_rAv(3), F_rBv(3), F_a1v(3)); %vänster hjul
[Mhogerh, Nhogerh, Thogerh] = Snittstorheter(n, F_rAh(3), F_rBh(3), F_a1h(3)); %höger hjul

%Spänningar
[sigmahogerv, tauhogerv] = Spanning(n,xvec,Nhogerv,Mhogerv,Thogerv);
[sigmahogerh, tauhogerh] = Spanning(n,xvec,Nhogerh,Mhogerh,Thogerh);

%Effektivspänning
[sigmaehogerv] = Effektivspanning(n,xvec,sigmahogerv,tauhogerv,Mhogerv,Nhogerv);
[sigmaehogerh] = Effektivspanning(n,xvec,sigmahogerh,tauhogerh,Mhogerh,Nhogerh);

%% Beräkning av storheter: acceleration

%Snittstorheter
[Maccv, Naccv, Taccv] = Snittstorheter(n, F_rAv(4), F_rBv(4), F_a1v(4)); %vänster hjul
[Macch, Nacch, Tacch] = Snittstorheter(n, F_rAh(4), F_rBh(4), F_a1h(4)); %höger hjul

%Spänningar
[sigmaaccv, tauaccv] = Spanning(n,xvec,Naccv,Maccv,Taccv);
[sigmaacch, tauacch] = Spanning(n,xvec,Nacch,Macch,Tacch);

%Effektivspänning
[sigmaeaccv] = Effektivspanning(n,xvec,sigmaaccv,tauaccv,Maccv,Naccv);
[sigmaeacch] = Effektivspanning(n,xvec,sigmaacch,tauacch,Macch,Nacch);
%% Beräkning av storheter: acceleration

%Snittstorheter
[Mbromsv, Nbromsv, Tbromsv] = Snittstorheter(n, F_rAv(5), F_rBv(5), F_a1v(5)); %vänster hjul
[Mbromsh, Nbromsh, Tbromsh] = Snittstorheter(n, F_rAh(5), F_rBh(5), F_a1h(5)); %höger hjul


%Spänningar
[sigmabromsv, taubromsv] = Spanning(n,xvec,Nbromsv,Mbromsv,Tbromsv);
[sigmabromsh, taubromsh] = Spanning(n,xvec,Nbromsh,Mbromsh,Tbromsh);

%Effektivspänning
[sigmaebromsv] = Effektivspanning(n,xvec,sigmabromsv,taubromsv,Mbromsv,Nbromsv);
[sigmaebromsh] = Effektivspanning(n,xvec,sigmabromsh,taubromsh,Mbromsh,Nbromsh);
%% Beräkning av storheter: skjuvspänning höger kurva

[tau_shear_hh] = Skjuvspanning(n,xvec,F_fh(2));
[tau_shear_hv] = Skjuvspanning(n,xvec,F_fv(2));


%% Beräkning av storheter: skjuvspänning vänster kurva

[tau_shear_vh] = Skjuvspanning(n,xvec,F_fh(3));
[tau_shear_vv] = Skjuvspanning(n,xvec,F_fv(3));


%% Plot av moment, tvärkraft och normalkraft för samtliga fall

Varnames = ["Rakt fram","Vänsterkurva","Högerkurva","Acceleration","Bromsning"];

%Momentdiagram vänster

% figure(1)
% plot(xvec,Mrakv)
% hold on
% plot(xvec,Mvansterv)
% plot(xvec,Mhogerv)
% plot(xvec,Maccv)
% plot(xvec,Mbromsv)
% hold off
% title("Moment vänsterhjul")
% legend(Varnames)
% 
% %momentdiagram höger
% figure(2)
% plot(xvec,Mrakh)
% hold on
% plot(xvec,Mvansterh)
% plot(xvec,Mhogerh)
% plot(xvec,Macch)
% plot(xvec,Mbromsh)
% hold off
% title("Moment högerhjul")
% legend(Varnames)
% 
% 
% %Tvärkraftdiagram vänster
% 
% figure(3)
% plot(xvec,Trakv)
% hold on
% plot(xvec,Tvansterv)
% plot(xvec,Thogerv)
% plot(xvec,Taccv)
% plot(xvec,Tbromsv)
% hold off
% title("Tvärkraft vänsterhjul")
% legend(Varnames)
% 
% 
% %Tvärkraftdiagram höger
% 
% figure(4)
% plot(xvec,Trakh)
% hold on
% plot(xvec,Tvansterh)
% plot(xvec,Thogerh)
% plot(xvec,Tacch)
% plot(xvec,Tbromsh)
% hold off
% title("Tvärkraft högerhjul")
% legend(Varnames)
% 
% %Normalkraftdiagram vänster
% 
% figure(5)
% plot(xvec,Nrakv)
% hold on
% plot(xvec,Nvansterv)
% plot(xvec,Nhogerv)
% plot(xvec,Naccv)
% plot(xvec,Nbromsv)
% hold off
% title("Normalkraft vänsterhjul")
% legend(Varnames)
% 
% 
% %Normalkraftdiagram höger
% 
% figure(6)
% plot(xvec,Nrakh)
% hold on
% plot(xvec,Nvansterh)
% plot(xvec,Nhogerh)
% plot(xvec,Nacch)
% plot(xvec,Nbromsh)
% hold off
% title("Normalkraft högerhjul")
% legend(Varnames)
% 
% figure(7)
% plot(xvec,sigmarakv)
% hold on
% plot(xvec,sigmavansterv)
% plot(xvec,sigmahogerv)
% plot(xvec,sigmaaccv)
% plot(xvec,sigmabromsv)
% hold off
% title("Normalspänning vänster hjul")
% legend(Varnames)
% 
% figure(8)
% plot(xvec,sigmarakh)
% hold on
% plot(xvec,sigmavansterh)
% plot(xvec,sigmahogerh)
% plot(xvec,sigmaacch)
% plot(xvec,sigmabromsh)
% hold off
% title("Normalspänning höger hjul")
% legend(Varnames)
% 
% figure(9)
% plot(xvec,taurakv)
% hold on
% plot(xvec,tauvansterv)
% plot(xvec,tauhogerv)
% plot(xvec,tauaccv)
% plot(xvec,taubromsv)
% hold off
% title("Skjuvspänning vänster hjul")
% legend(Varnames)
% 
% figure(10)
% plot(xvec,taurakh)
% hold on
% plot(xvec,tauvansterh)
% plot(xvec,tauhogerh)
% plot(xvec,tauacch)
% plot(xvec,taubromsh)
% hold off
% title("Skjuvspänning höger hjul")
% legend(Varnames)
% 
% figure(11)
% plot(xvec,sigmaerakv)
% hold on
% plot(xvec,sigmaevansterv)
% plot(xvec,sigmaehogerv)
% plot(xvec,sigmaeaccv)
% plot(xvec,sigmaebromsv)
% hold off
% title("Skjuvspänning höger hjul")
% legend(Varnames)
% 
% 
% figure(12)
% plot(xvec,sigmaerakh)
% hold on
% plot(xvec,sigmaevansterh)
% plot(xvec,sigmaehogerh)
% plot(xvec,sigmaeacch)
% plot(xvec,sigmaebromsh)
% hold off
% title("Skjuvspänning höger hjul")
% legend(Varnames)

name = ["högerkurva högerhjul", "högerkurva vänsterhjul", "vänsterkurva högerhjul", "vänsterkurva vänsterkurva"];

figure(13)
hold on
plot(L,tau_shear_hh)
plot(L,tau_shear_hv)
plot(L,tau_shear_vh)
plot(L,tau_shear_vv)
hold off
title("Skjuvspänning")
name = ["högerkurva högerhjul", "högerkurva vänsterhjul", "vänsterkurva högerhjul", "vänsterkurva vänsterkurva"];

legend(name)
