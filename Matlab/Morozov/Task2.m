function[S] =Task2(L,k,m1,m2,y)
y = Task1(1,16,5,-10:100); %call function Task1
%Initial parameters
n = 1;
p = y(1,n);
q = y(1,n);
s = y(1,n);

while n <=size(y,2)
    
    if n-k <= 0  %Compliance with the condition n-k<0
        dk(n) = y(1,n);
    else
        dk(n) = y(1,n) - y(1,n-k);
    end
    
    if n-1 <=0   %Compliance with the condition n-1<0
        dL(n) = y(1,n);
    else
        dL(n) = y(1,n) - y(1,n-1);
    end
    
    if n-L <=0   %Complitnce with the condition n-1<0
        p = p + dk(n);
    else
        p = p + dk(n) - k*dL(n-L);
    end
    
    %The last function of algorithm
    
    q = q + m2*p;
    
    s = s + q + m1*p;
    
    S(n) = s;
    
    n = n+1;
end