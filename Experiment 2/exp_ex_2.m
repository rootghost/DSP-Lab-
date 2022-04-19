clc 
close all
clear all

n=0:0.987:1200;

u1=(n-0>=0);
u2=(n-240>=0);
x1=10*sin(0.065*n).*(u1-u2);

u3=(n-450>=0);
u4=(n-774>=0);
echo=0.5*sin(0.065*n).*(u3-u4);

noise=randn(1,length(echo));
yn=echo+noise;


[corr,t]=xcorr(yn, x1);

subplot(411); plot(n,x1);
subplot(412); plot(n,echo);
subplot(413); plot(n,yn);
subplot(414); plot(t,corr/max(corr))