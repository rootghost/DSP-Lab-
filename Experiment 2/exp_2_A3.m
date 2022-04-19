n = 0:52;
x = sin(0.36*n)
y = zeros(1,length(x));
L=3;
for i = 1:length(x)
    if rem(i,L) == 0
        y(i) = x(i)
    end
end

figure(1)
stem(n,x)
figure(2)
stem(n,y)