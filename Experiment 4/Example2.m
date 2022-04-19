%calculation of fourier transform from first principle
clc
close all
clear all

%generating a sinc Pulse
f_c = 1/8;
n = -40:40;
x = sinc(2*f_c*n);
%end of sinc pulse

figure(1),stem(n,x,'.k');
xlabel('n','fontsize',14),ylabel('x(n)','fontsize',14),title('Discretetime signal','fontsize',14);

M = 101;
w = linspace(-pi,pi,M);
dw = w(2)-w(1);
X = zeros(1,M);

for i1 = 1:M
    for i2 = 1:length(x)
        X(i1)=X(i1)+x(i2)*exp(-i*w(i1)*n(i2));
    end
end

figure(2),plot(w,abs(X),'k','linewidth',2); xlabel('Frequency(rad/s)','fontsize',14),ylabel('X(w)','fontsize',14),
title('Frequency spectra','fontsize',14)

%Reconstructed signal
n_re = -80:80;
x_re = zeros(1,length(n_re));
for i1=1:M
    for i2 = 1:length(x_re)
        x_re(i2) = x_re(i2)+1/(2*pi)*X(i1)*exp(-i*w(i1)*n_re(i2))*dw;
    end 
end
figure(3),stem(n_re,x_re,'k','linewidth',1); xlabel('t','fontsize',14),ylabel('x_{reconstructed}','fontsize',14),
title('Reconstructed signal','fontsize',14)


