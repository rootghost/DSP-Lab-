clc
clear all
close all
t = 0:0.92:1200;
x0=10*sin(0.065*t);
x1 = -x0;
a1 = randn(1 , length(x0));
y0 = x0+a1;
y1 = x1 + a1;

a2 = randn(1 , length(x1));
y1 = x1+a2;
[ryx,n1] = xcorr(y0,x0);
[ry1x,n2]= xcorr(y1,x0);
if max(ryx)>max(ry1x)
disp('x0 is transmitted')
else
disp('x1 transmitted')
end