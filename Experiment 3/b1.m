clc
clear all
close all

b = [1 0.2];
a = [1 0.4 -0.12];
%Two ways to find impulse response
%Method one
n = 0:9;
imp = n==0;
[hf t] = filter(b,a,imp);

%Method 2
[h t] = impz(b,a,10)

%plotting
subplot(2,1,1)
stem(h)
grid on;
hold on;
subplot(2,1,2)
stem(hf,'.g')
grid on;
