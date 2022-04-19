n = -4:4;
y = (n>=0).*n

[yf,n] = sigfold(y,n);%folding signal y
[h,k] = sigadd(y,n,yf,n) % adding y+yf
xe = h*0.5
[w,x] = sigadd(y,n,-yf,n);% adding y+(-yf)
xo = w*0.5;

figure(1)
stem(n,xe);
figure(2)
stem(n,xo);