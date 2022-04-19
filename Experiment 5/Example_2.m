clc
close all
clear all
B = [0 1 5];
M = 21;
Nfft = 512;
n = 0:M-1;
rad_freq = linspace(-pi,pi,Nfft);
for i = 1:length(B)
    w1 = besseli(0,B(i)*sqrt(1-(1-2*n/(M-1)).^2))/besseli(0,B(i));
    H1 = fftshift(fft(w1,Nfft));
    figure(1);
    subplot(3,1,i),plot(n,w1);grid on;title(['kaiser window for B = ',num2str(B(i))]);
    figure(2);
    subplot(3,1,i),plot(rad_freq,db(abs(H1)));grid on;title(['kaiser magnitude db for B = ',num2str(B(i))])
end