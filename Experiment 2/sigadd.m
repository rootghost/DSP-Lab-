function [y,n] = sigadd(x1,n1,x2,n2)
n= min(n1(1),n2(1)):max(n1(end),n2(end));
y1(find((n>=n1(1)) & (n<=n1(end)))) = x1;
y2(find((n>=n1(1)) & (n<=n1(end)))) = x2;
y = y1+y2;
