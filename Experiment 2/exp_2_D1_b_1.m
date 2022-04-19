clc
close all
clear all

T = 2e-3;
tstep = T/100;
t = tstep:tstep:T;

x = 2*sin(2*pi*t/T);
[y,n] = sigfold(x,t);

acf = conv(x,y);
time_index = t(1)+n(1):tstep:t(end)+n(end);

%ACF for t=tstep:step:3*T
t_1 = tstep:tstep:3*T;
x_1 = 2*sin(2*pi*t_1/T);
[y_1,n_1] = sigfold(x_1,t_1);
acf_1 = conv(x_1,y_1);
time_index_1 = t_1(1)+n_1(1):tstep:t_1(end)+n_1(end);

%ACF of random white noise
px = sum(x.^2)/length(x);
SNR = -5;
py = px/10^(SNR/10);
n = sqrt(py)*randn(1,length(t));
[Rnn,lags] = xcorr(n);

%Plotting ACF
subplot(3,1,1)
stem(time_index,acf)
title("ACF for x=2sin(2*pi*t/T)")
subplot(3,1,2)
stem(time_index_1,acf_1)
title("ACF for x=2sin(2*pi*t/3T)")
subplot(3,1,3)
stem(lags,Rnn)
title("ACF for random white noise")
