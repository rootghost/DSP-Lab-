clc
close all
clear all
x = [1 -7/4 -1/2];
n = 4;
y = x(end);
if(abs(y) > 1)
disp("Unstable")

return
end
for n=1:n-1
x = (x-y*flip(x))/(1-y*y);
x(length(x)) = [];
k = x(end);
if(abs(y) < 1)
disp("Unstable")
return
end
end
disp("stable")