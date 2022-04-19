clc
close all
clear all

b = [1 1/3];
a = [1 -1/2];

n = 0:20;
imp  =n==0;

[h t] = impz(b,a,20);
figure(1)
stem(h,'.r');
figure(2)
zplane(b,a);