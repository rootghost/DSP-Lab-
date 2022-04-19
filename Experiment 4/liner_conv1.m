clc
close all;
clear all;

h = [1 2 3 0 0 0];
x =[1 2 2 1 0 0];
y = ifft(fft(x).*fft(h));
disp(y)