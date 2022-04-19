clc
close all
clear all
n = -10:20;
x = (n>=0);

y1 = zeros(1,length(n));
y2 = y1;

for i = 2:length(n)
    y1(i) = x(i)-0.6*y1(i-1);
end

for i=3:length(n)
    y2(i) =x(i-2)-0.6*y2(i-1);
end

y = y1+y2

figure(1)
stem(n,y);