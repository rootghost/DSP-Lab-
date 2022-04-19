clc
close all
clear all

n = 1:50;
M = 3;
x = 2.*n.*((0.9).^n);
d = rand(1,50)- 0.5;
c = x+d;
z = [];
v = [];
sum =0;

for i=1:50
sum = 0;
for j = 0:(M-1)
if (i-j)<=0
break
end
z(i) = c(i-j)*(1/M);
sum = sum + z(i);
end
v(i)=sum
end

subplot(2,1,1),
plot(n,c)

subplot(2,1,2),
plot(n,v)
