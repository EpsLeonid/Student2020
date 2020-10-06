function[S] = Func2(k,l,m1,m2,y)
y = Func1(1,16,5,-10,100);
%entry parametres 
n = 1;
p = y(1,n);
q = y(1,n);
s = y(1,n);
while n <= size(y,2)
    
    if n-k <= 0 %comparison of n array element with k
    dk(n) = y(1,n);% all summands turn into 0 exept the first
    else
    dk(n) = y(1,n) - y(1,n-k);
    end
    
    if n-1 <= 0 %comparison of n array element with 1
    d1(n) = y(1,n);% all summands turn into 0 exept the first
    else
    d1(n) = y(1,n) - y(1,n-1);
    end
    
    if n-l <= 0 %comparison of n array element with l
    p = p + dk(n);
    else
    p = p + dk(n) - k*d1(n-l);
    end
    % The last function of algorithm
    q = q + m2*p;
    s = s + q + m1*p;
    S(n) = s;
    n = n + 1;
end