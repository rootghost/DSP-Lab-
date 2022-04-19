n= -10:20;

x_impulse = ((n-0)==0);
x_step = ((n-0)>=0)
x_sinusoid = 0.5*sin(n)

y_impulse = zeros(1,length(n));
y_step = zeros(1,length(n));
y_sinusoid = zeros(1,length(n))

for i =2:length(x_impulse)
    y_impulse(i)=x_impulse(i)-0.6*y_impulse(i-1);
end

for i =2:length(x_step)
    y_step(i)=x_step(i)-0.6*y_step(i-1);
end

for i =2:length(x_step)
    y_sinusoid(i)=x_sinusoid(i)-0.6*y_sinusoid(i-1);
end

%verify result using convolution
k = -20:40
y_v_step = conv(y_impulse,x_step);
y_v_sinusoid = conv(y_impulse,x_sinusoid);


figure(1)
subplot(3,1,1)
stem(n,y_impulse);
subplot(3,1,2)
stem(n,y_step);
subplot(3,1,3)
stem(n,y_sinusoid);

%plotting verified result after convolution
figure(2)
subplot(2,1,1)
stem(k,y_v_step);
subplot(2,1,2)
stem(k,y_v_sinusoid);


