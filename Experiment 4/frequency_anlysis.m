clc
close all;
clear all;

f1 = 500;
f2 = 1000;
fs = 8000;
ts = 1/fs;
t = (0:4*fs/f2-1)*ts;
x = sin(2*pi*f1*t)+ 0.05*sin(2*pi*f2*t);
f = (0:length(t)-1)/(length(t)*ts)-1/(2*ts);
figure(1)
subplot(211),
stem(t,x),xlabel('Time(seconds)'),ylabel('X[n]')
subplot(212),stem(f,abs(fftshift(fft(x)))),xlabel('Frequency (Hz)'),ylabel('|x|')
axis([-4000,4000,0,32]);
