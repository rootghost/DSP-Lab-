clc
clear all
close all
b = [1 0 0];
a = [1 -2.5 1];
[z,p,g] = tf2zp(b,a); %poles, zeros and gain
pp = [];
for i=1:length(p)
if p(i) < 1
pp(end + 1) = p(i);
end
end
fa = zpk(z,pp,1,0.1);
pp = [];
for i=1:length(p)
if abs(p(i)) >= 1
pp(end+1) = p(i);
end
end
fb = zpk(z,pp,1,0.1);