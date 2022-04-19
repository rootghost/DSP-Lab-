function [Y N] = corlnf(x,n,y,m)
[r,c] = size(y);
if c==1
    y = flippud(y);
else
    y = fliplr(y);
end
[r,c] = size(m);
if c==1
    m = -flippud(m);
else
    m = -fliplr(m);
end
start = min(n)+min(m);
N = start:(start+length(m)+length(n)-2);
for i=1:length(m)
    YY(:,i) = x*y(i);
end
y = zeros(1,length(N));
for NN = 1:length(N)
    for i=1:NN
        j = NN-i+1
        if(i<=length(n) && j<=length(m))
            y(NN) = y(NN)+YY(i,j);
        end
    end
end