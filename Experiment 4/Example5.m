clc
close all
clear all
%Calculation of 5 point DFT
x = [1,1,0,0,1];
N = 5;
L = length(x);
x = [x zeros(1,N-L)];
n = length(x);
n = 0:N-1;
k = 0:N-1;
Wn = exp(-j*2*pi/N);
WN = Wn.^(n'*k);
X = WN*x';

figure(1),subplot(211),stem(k/N,abs(X),'k','linewidth',2),xlabel('Digital Frequency ,f(Hz)','fontsize',14),
ylabel('|X(f)|','fontsize',14),title('Magnitude spectrum','fontsize',14);
subplot(212),stem(k/N,angle(X)*180/pi,'k','linewidth',2),xlabel('Digital Frequency ,f(Hz)','fontsize',14),
ylabel('angle(X(f))','fontsize',14),title('Phase  spectrum','fontsize',14);
abs(X)
angle(X)*180/pi

