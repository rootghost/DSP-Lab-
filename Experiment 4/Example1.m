clc
close all
clear all
Fs = 100e3;
dt = 1/Fs;

%generating rectangular pulse train
T =1e-3;
D = .1;
PW = D*T;
f=1/T;
t = -T:dt:T;
n = t/dt;
L = PW/dt;
x= zeros(1,length(t));
x(find(abs(n)<=L/2)) = 1.1;
%End of rectangular pulse train
figure(20)
subplot(211),
plot(t,x,'k','linewidth',2),
xlabel('Time(seconds)','fontsize',14),
ylabel('x(t)','fontsize',14),
title('(a) original continuous signal','fontsize',14);
subplot(212)
stem(n,x,'.k','linewidth',2);
xlabel('index,n','fontsize',14),
ylabel('x(n)','fontsize',14),title('(b) sampled discrete signal','fontsize',14);

N = length(x);
Nc = 0.3*N %total number of coefficient;
if mod(N,2) == 0
    k = -N:N;
else
    k = -(N-1):(N-1);
end
c = zeros(1,length(k));
for i1 = 1:length(k)
    for i2 = 1:length(x)
        c(i1) = c(i1)+1/N*x(i2)*exp(-i*2*pi*k(i1)*n(i2)/N);
    end
end
figure(2)
subplot(211),stem(k,abs(c),'.k','linewidth',2);
xlabel('k','fontsize',14),ylabel('|c_k|','fontsize',14),title('Fourier series coefficients c_k','fontsize',14);
subplot(212),stem(k,angle(c)*180/pi,'.k','linewidth',2);
xlabel('k','fontsize',14),ylabel('angle(c_k)','fontsize',14)

figure(3),stem(k*f,c,'.k','linewidth',2);xlabel('frequency(Hz)','fontsize',14),ylabel('c_k','fontsize',14),title('fourier series coefficient c_k','fontsize',14)
%start of reconstruction of signal
t_remax  =T/2;
t_re = -t_remax:dt:t_remax;
n_re = t_re/dt;
x_re = zeros(1,length(n_re));

for i1 = 1:length(k)
    for i2 = 1: length(x_re)
        x_re(i2) = x_re(i2)+c(i1)*exp(i*2*pi*k(i1)*n_re(i2)/N);
    end
end
%end of reconstruction of signal

figure(4)
subplot(211),stem(n_re,x_re,'.k','linewidth',2);
xlabel('n','fontsize',14),ylabel('x_{reconstructed}','fontsize',14),title('Reconstructed signal','fontsize',14);
subplot(212),plot(t_re,x_re,'k',0,0,'linewidth',2);
xlabel('t','fontsize',14),ylabel('x_{reconstructed}','fontsize',14),title('reconstructed signal','fontsize',14);



    




