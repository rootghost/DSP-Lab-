clc
clear all;
close all;
x1 = [1 2 3 4];
x2 = [2 3 4 5];
x_2 = [x2(1) x2(4) x2(3) x2(2);x2(2) x2(1) x2(4) x2(3);x2(3) x2(2) x2(1) x2(4);x2(4) x2(3) x2(2) x2(1)];
x_1 = [x1(1);x1(2);x1(3);x1(4)];
y = x_2*x_1;
disp(y)

y_1 = gallery('circul',x2)'*x1';
disp(y_1)

figure(1)
subplot(311)
stem(x1);
subplot(312)
stem(x2);
subplot(313)
stem(y_1);
