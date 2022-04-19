clc
close all
clear all

ws = 2.2;
wp = 1.8;
wc = 2;
deltap = 0.05;
deltas = 0.005;
delta = min(deltap,deltas);
A = -20*log10(delta);
Beta = 0.5842*(A-21)^0.4+0.07886*(A-21);
M = ceil(1+(A-8)/(2.285*(ws-wp)));
n = 0:M-1;
w = besseli(0,Beta*sqrt(1-(1-2*n/(M-1)).^2))/besseli(0,Beta);
hd = (wc/pi)*sinc(wc/pi*(n-(M-1)/2));
h = hd.*w;
H = fftshift(fft(h,512));
rad_freq = linspace(-pi,pi,512);

figure(1);
subplot(311),plot(rad_freq,abs(H));
grid on;title('Magnitude');
subplot(312),plot(rad_freq(440:end),abs(H(440:end)));
grid on;title('pass band');
subplot(313),plot(rad_freq(150:350),abs(H(150:350)));
grid on;title('stop band');