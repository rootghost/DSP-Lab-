%c3
clc
clear
close all

b = [1 0];
a = [1 -1];
n = 0:20;

step= (n>=0);
imp  = n==0;

[hf t] = impz(b,a,20);
[h t] = filter(b,a,step);

figure(1)
subplot(2,1,1)
stem(hf);
subplot(2,1,2)
stem(h)
figure(2)
zplane(b,a)
