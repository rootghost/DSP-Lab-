%Matrix implementation of DTFT
x=[1,3,-9,5,10];
n1 = -1;
n2 = 3;
n = n1:n2
M = 500;
w =(-M/2:M/2)*2*pi/M;
W = exp(-j*w'*n);
X = W*x';

figure(1),subplot(211),plot(w/(2*pi),abs(X),'k','linewidth',2),xlabel('Digital Frequency f','fontsize',14),
ylabel('|x(f)|','fontsize',14),title('Magnitude Spectrum','fontsize',14);
subplot(212),plot(w/(2*pi),angle(X)*180/pi,'k','linewidth',2),xlabel('Digital frequency f','fontsize',14),
ylabel('angle(X(f))','fontsize',14),title('Phase spectrum','fontsize',14);