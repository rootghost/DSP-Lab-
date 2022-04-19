clc
close all
clear all

b = input('Enter numinator coefficient : ');
a = input('Enter denominator coefficient : ');

[z p k] = tf2zp(b,a);
[sos k] = zp2sos(z,p,k);
figure(1)
zplane(b,a)

p_v=sort(abs(p));
for i=1:length(p_v)
    if i<length(p_v) && p_v(i) == p_v(i+1)
        continue;
    end
    if p_v(i) == length(p_v)
        disp("|z|>"+p_v(i)+ "causal")
    elseif p_v(i) == min(p_v)
         disp("|z|<"+p_v(i)+ "anticausal")
    else
        disp(p_v(i) +"<|z|<" +p_v(i+1)+ "non causal")
    end
end

         
        
        