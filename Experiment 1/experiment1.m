clc 
clear all
close all

%sampling_process
t =0:0.001:0.5;
xa = sin(2*pi*20*t)+cos(2*pi*50*t)+cos(2*pi*80*t);
Fs = 160;
Ts = 1/Fs;
ts = 0:Ts:0.5;
xs =  sin(2*pi*20*ts)+cos(2*pi*50*ts)+cos(2*pi*80*ts);
figure(1)
plot(t,xa);
grid on;
figure(2)
stem(ts,xs);
grid on;

%A_law compression
a = 87.56;
y = xs;
for k = 1:length(xs)
    s = xs(k)/max(xs);
    if 1/a <=abs(s) && abs(s)<=1
        y(k) = (1+log(a*abs(s)))/(1+log(a))
    elseif 0<=abs(s) && abs(s)<1/a
        y(k) = a*abs(s)/(1+log(a))
    end
end

figure(3)
stem(ts,y);
grid on;

%Quantization_process
bit = 4;
quantization_level = 2^bit - 1;
step_size = (max(xs) - min(xs))/quantization_level;
quant = linspace(min(xs),max(xs),quantization_level);
xq = zeros(1,length(xs));%for quantized value
xbb = zeros(1,length(xs))
for i=1:length(xs)
    for j=1:length(quant) - 1
        if xs(i)>=quant(j) && xs(i)<=quant(j)+step_size/2
            xq(i) = quant(j);
            xbb = j
            
        elseif xs(i)>=quant(j)+step_size/2 && xs(i)<=quant(j+1)
            xq(i) = quant(j+1);
            xbb = j+1
        end
    end
    
end

figure(4)
stairs(ts,xq);
grid on;

%encoding
xbin = dec2bin(xbb);
disp(xbin)

%calculation of sqnr
px = sum(xs.^2)/length(xs);
error_signal = xs - xq;
pe = sum(error_signal.^2)/length(error_signal);
SQNR = 10*log10(px/pe);
disp(SQNR);




