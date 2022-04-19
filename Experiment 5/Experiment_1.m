clc
close all
clear all

Nfft = 512;
L = 21;

f = ((0:1/Nfft:1-1/Nfft)-1/2)*2*pi

h1 = [hann(L)' zeros(1,Nfft-L)];
H1 = fftshift(fft(h1,Nfft));
figure(1);
subplot(211),plot(f,db(abs(H1)));grid on;title('Hann Magnitude');
subplot(212),plot(f,angle(H1));grid on;title('Phase');
aa

