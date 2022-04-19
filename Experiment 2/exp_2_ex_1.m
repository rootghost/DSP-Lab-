clc
clear all
close all

x1 = [0,1,1,3,5,7,2,0];
x2=[0,4,4,4,2,2,1,1,0];
n1 = [-2:5];
n2 = [-6:2];

kmin = -15;
kmax = 15;
k = kmax:kmin;

xe = [zeros(1,n1(1)-kmin) x1 zeros(1,n1(1)-kmax)];
ye = [zeros(1,n1(1)-kmin) x1 zeros(1,n1(1)-kmax)];
rxy = zeros(1,kmax-kmin+1);

for i=kmin+x2(1):kmax-x2(end)
if i > 0
rs = [zeros(1,i) ye(1:length(ye)-i)];
else
rs = [ye(1-i:length(ye)) zeros(1,-i)];
end
rxy(i-kmin+1-x2(1)) = sum(xe.*rs);
end
figure;
stem(kmin:kmax,rxy)

    