function [S]=graphic2(k,M,t,l,Y)
p=0


for  n=1:length(t)

    if n==1
        d(n)=Y(n);
        p=p+d(n);
        r=p+M*d(n);
        S(n)=r;
    end
    
    if n-k <= 0
        a=0;
    else
        a=Y(n-k);
    end
    
    if n-l <= 0
        b=0;
    else
        b=Y(n-l);
    end
    
    if n-k-l <= 0
        c=0;
    else
        c=Y(n-k-l);
    end
    
    if n>1
    d(n)=Y(n)-a-b+c;
    p=p+d(n);
    r=p+M*d(n);
    S(n)=S(n-1)+r;
    end
    end
end




