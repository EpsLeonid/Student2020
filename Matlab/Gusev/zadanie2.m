function[S] = zadanie2(k,l,M)
y = zadanie1(1,16,5,-10,100);
n = 1;
p = 0;
s = 0;
while n <= size(y,1)
    
    m = n - k - l;
    if m <= 0
        V1(n) = 0;
    else
        V1(n) = y(m,2);
    end
    
    i = n - k;
    if i <= 0
        V2(n) = 0;
    else
        V2(n) = y(i,2);
    end    
    
    c = n - l;
    if c <= 0
        V3(n) = 0;
    else
        V3(n) = y(c,2);
    end
    
    d(n) = y(n,2) - V1(n) - V2(n) + V3(n);
    p = p + d(n);
    r = p + M*d(n);
    s = s + r;
    S(n) = s;
    n = n + 1;
end