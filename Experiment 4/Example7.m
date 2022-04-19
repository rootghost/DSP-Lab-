%Example 7
clc
close all
clear all
%fs=4*Bw
to = 1;
ts = .0025;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;
n = nlo:nup;
t = n*ts;
m =(sinc(100*t)).^2;
N = 1024;
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-j*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
subplot(211),plot(fn,abs(fftshift(M)),0,0)

%fs=2*Bw
to = 1;
ts = .005;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;
n = nlo:nup;
t = n*ts;
m =(sinc(100*t)).^2;
N = 1024;
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-j*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
figure(2)
subplot(211),plot(fn,abs(fftshift(M)),0,0)

%fs=1.25*Bw
to = 1;
ts = .008;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;
n = nlo:nup;
t = n*ts;
m =(sinc(100*t)).^2;
N = 1024;
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-j*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
figure(3)
subplot(211),plot(fn,abs(fftshift(M)),0,0)

%fs=Bw
to = 1;
ts = .01;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;
n = nlo:nup;
t = n*ts;
m =(sinc(100*t)).^2;
N = 1024;
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-j*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
figure(4)
subplot(211),plot(fn,abs(fftshift(M)),0,0)


