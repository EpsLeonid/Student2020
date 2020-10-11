function y2=test2(k,l,m1,m2,y)
% parameters for function test1
A=1;
T1=16;
T2=5;
t=-10:100;
y = test1(A,T1,T2,t); % call function test1
% initial conditions
n = 1;
p = y(1,n);
q = y(1,n);
s = y(1,n);

while n <=size(y,2) % dimension

    if n-k <= 0     % compliance with the condition n-k<0
    dk(n) = y(1,n);
    else
    dk(n) = y(1,n) - y(1,n-k);
    end
    
    if n-1 <=0       % compliance with the condition n-1<=0
    dl(n) = y(1,n);
    else
    dl(n) = y(1,n) - y(1,n-1);
    end
    
    if n-l <=0       % compliance with the condition n-l<=0
    p = p + dk(n);
    else
    p = p + dk(n) - k*dl(n-l);
    end
    
q = q + m2*p;

s = s + q + m1*p; % appropriation function
y2(n) = s;

n = n+1;

end


